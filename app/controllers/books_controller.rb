class BooksController < ApplicationController
  before_action :get_icons, only: [:index, :new, :search]
  before_action :get_colors, only: [:index, :new, :search]

  def root
    @sentence = StealSentence.offset( rand(StealSentence.count) ).first
    @latest_books = Book.all.order("created_at DESC").limit(8)
    @new_story_books = []
    get_new_story_books
  end

  def index
    @books = Book.includes(book_set_content).all.order(id: "DESC")
    @search_title = "一覧表示"
    @search_count = @books.count
  end

  def new
    @book = Book.new
    @sentences = StealSentence.where(user_id: current_user)
  end

  def create
    @book = new_book
    @text = new_text
    if @book.judge_create_book && @text.judge_create_text
      @book.save
      @text = new_text
      @text.save
      redirect_to( { action: :show, id: @book.id } , notice: '本を投稿しました。' )
    else
      redirect_to( { action: :new }, notice: '本の投稿に失敗しました。' )
    end
  end

  def edit
    if current_user.rental != 0 && current_user.rental != -1 #  貸出中の時
      @book = Book.find(current_user.rental)
      @chapter = @book.texts.count + 1
      @sentences = StealSentence.where(user_id: current_user)
    else
      redirect_to request.referer, notice: '貸出中の本がありません。'
    end
  end

  def update
    @book = this_book
    @text = new_text
    if current_user.rental != @book.id
      redirect_to( { action: :show, id: @book.id }, notice: 'この本は返却済みのため、文章の投稿に失敗しました。' )
    elsif @text.judge_create_text
      if params[:book][:completion].to_i == 1
        @book.completion = params[:book][:completion].to_i
      end
      rental_reset
      @book.touch
      @text.save
      redirect_to( { action: :show, id: @book.id }, notice: '文章を投稿しました。' )
    else
      redirect_to( { action: :edit }, notice: '文章の投稿に失敗しました。' )
    end
  end

  def show
      @my_story = Text.new
    if user_signed_in? && current_user.rental == params[:id].to_i
      redirect_to action: :edit
    else
      @book = this_book
    end
  end

  def search
    @sort = params[:sort] # 並び順
    if @sort == ""
      @sort = "created_at DESC"
    end
    @keyword = params[:keyword] # 検索ワード
    if params[:rental_state] # 貸出状態
      @sort_rental_state = get_sql_rental_state
      @rental_state_hidden_params = params[:rental_state]
    end
    if params[:book_icon] # 表紙のアイコン
      @sort_book_icon = get_sql_sort_book_icon
      @book_icon_hidden_params = params[:book_icon]
    end
    if params[:book_color] # 表紙の色
      @sort_book_color = get_sql_sort_book_color
      @book_color_hidden_params = params[:book_color]
    end
    
    if @keyword == ""
      @search_title = "一覧表示"
    else
      @search_title = "#{@keyword}の検索結果"
    end
    
    @books = sortBooks
    @search_count = @books.count
    render action: :index
  end

  def search_userid
    @books = Book.search_userid(params[:id]).order(id: "DESC")
    @search_title = "#{User.find(params[:id]).name}さんが投稿した本"
    @search_count = @books.count
    render action: :search
  end

  def search_bookmark
    @books = Book.includes(:bookmarks).where(bookmarks: {user_id: params[:id]}).order(id: "DESC")
    @search_title = "#{User.find(params[:id]).name}さんがお気に入り登録した本"
    @search_count = @books.count
    render action: :search
  end

  def rental

    if User.rental_status(this_book.id) == "can_not_rental"
      redirect_to( { action: :show }, notice: 'この本はあなたより先に別のユーザーに貸し出されました。' )
    elsif current_user.rental == 0
      rental_book
      three_days_ago = Time.now.since(3.days)
      redirect_to( { action: :edit }, notice: "本を貸出しました。貸出期限#{three_days_ago.month}月#{three_days_ago.day}日を過ぎると自動で返却されます。" )
    else
      rental_swap
      three_days_ago = Time.now.since(3.days)
      redirect_to( { action: :edit }, notice: "本を貸出しました。貸出期限#{three_days_ago.month}月#{three_days_ago.day}日を過ぎると自動で返却されます。" )
    end
  end

  def return
    @book = this_book
    @book.record_timestamps = false
    rental_reset
    redirect_to( { action: :show, id: @book.id }, notice: '本を返却しました。' )
  end

  def save_sentence
    @sentence = steal_sentence_params
    if @sentence.valid? && @sentence.save
    end
  end

  def bookmark
    if Bookmark.whetherBookmarked(current_user.id, params[:id].to_i)
      Bookmark.create(user_id: current_user.id, book_id: params[:id].to_i)
    end
    @count = Bookmark.bookmarkCount(params[:id].to_i)
  end

  def delete_bookmark
    Bookmark.where(user_id: current_user.id, book_id: params[:id].to_i).delete_all
    @count = Bookmark.bookmarkCount(params[:id].to_i)
  end

  private
  def get_icons
    @icons = Icon.all
  end

  def get_colors
    @colors = Color.all
  end

  def this_book
    Book.find(params[:id])
  end

  def this_user
    User.find(current_user.id)
  end

  def new_book
    Book.new(params.require(:book).permit(:title).merge(user_id: current_user.id, color_id: params[:book_color],icon_id: params[:book_icon]))
  end

  def new_text
    Text.new(params.require(:book).permit(:chapter, :text).merge(user_id: current_user.id, book_id: @book.id))
  end

  def steal_sentence_params
    id_of_the_user_who_wrote_the_text = Text.find(params[:text_id]).user_id
    StealSentence.new(params.permit(:sentence).merge(user_id: current_user.id, text_id: params[:text_id], stolen_user_id: id_of_the_user_who_wrote_the_text))
  end

  def rental_book
    @book = this_book
    @book.record_timestamps = false
    @book.rental = 1
    @book.save

    @user = this_user
    @user.rental = @book.id
    @user.save
  end

  def rental_reset
    @user = this_user
    @book.rental = 0
    @book.save
    @user.rental = 0
    @user.save
  end

  def rental_swap
    @rental_book = Book.find(current_user.rental)
    @rental_book.record_timestamps = false
    @rental_book.rental = 0
    @rental_book.save
    rental_book
  end

  def get_new_story_books
    @books = Book.all.order("updated_at DESC")
    texts = Text.group(:book_id).count
    @books.each_with_index do |book, i|
      if @new_story_books.length <= 8
        if texts[book.id] >= 2
          @new_story_books.push(book)
        end
      else
        break
      end
    end
  end

  def book_set_content
    [:user, :texts, :icon, :color, :bookmarks]
  end

  def get_sql_rental_state
    rental_state = ""
    
    if params[:rental_state].include? "rental"
      rental_state += "(rental = 0)"
    end

    if params[:rental_state].include? "notRental"
      if rental_state == ""
        rental_state += "(rental >= 1)"
      else
        rental_state += " OR (rental >= 1)"
      end
    end

    if (params[:rental_state].include? "rental") && (params[:rental_state].include? "notRental")
      rental_state.insert(0, "(")
      rental_state += ")"
    end

    if params[:rental_state].include? "complete"
      if rental_state == ""
        rental_state += "(completion = 1)"
      else
        rental_state += " OR (completion = 1)"
      end
    else
      if rental_state == ""
        rental_state += "(completion = 0)"
      else
        rental_state += " AND (completion = 0)"
      end
    end
    rental_state
  end

  def get_sql_sort_book_icon
    sql_sort_book_icon = ""
    params[:book_icon].each do |icon|
      if sql_sort_book_icon == ""
        sql_sort_book_icon += "(icon_id = #{icon.to_i})"
      else
        sql_sort_book_icon += " OR (icon_id = #{icon.to_i})"
      end
    end
    sql_sort_book_icon
  end

  def get_sql_sort_book_color
    sql_sort_book_color = ""
    params[:book_color].each do |color|
      if sql_sort_book_color == ""
        sql_sort_book_color += "(color_id = #{color.to_i})"
      else
        sql_sort_book_color += " OR (color_id = #{color.to_i})"
      end
    end
    sql_sort_book_color
  end

  def sortBooks
    sort_pattern = Book.includes(book_set_content).search(@keyword).where(@sort_rental_state).where(@sort_book_icon).where(@sort_book_color)

    if @sort == 'bookmarks DESC'
      sort_pattern.sort {|a,b| b.bookmarks.size <=> a.bookmarks.size}
    elsif @sort == 'bookmarks ASC'
      sort_pattern.sort {|a,b| b.bookmarks.size <=> a.bookmarks.size}.reverse
    else
      sort_pattern.order(@sort)
    end
  end

end
