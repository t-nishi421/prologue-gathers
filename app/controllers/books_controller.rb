class BooksController < ApplicationController

  def index
    @books = Book.all.order(id: "DESC")
    @search_title = "一覧表示"
    @search_count = @books.count
  end

  def new
    @book = Book.new
    @colors = Color.all
    @icons = Icon.all
    @sentences = StealSentence.where(user_id: current_user)
  end

  def create
    @book = new_book
    @text = new_text
    if @book.judge_create_book && @text.judge_create_text
      @book.save
      @text = new_text
      @text.save
      redirect_to( { action: :index } , notice: '本を投稿しました' )
    else
      redirect_to( { action: :new }, notice: '本の投稿に失敗しました' )
    end
  end

  def edit
    if current_user.rental != 0 #  貸出中の時
      @book = Book.find(current_user.rental)
      @chapter = @book.texts.count + 1
    else
      redirect_to user_path(current_user), notice: '貸出中の本がありません'
    end
  end

  def update
    @book = this_book
    @text = new_text
    if @text.judge_create_text
      if params[:book][:completion].to_i == 1
        @book.completion = params[:book][:completion].to_i
      end
      rental_reset
      @book.touch
      @text.save
      redirect_to( { action: :show, id: @book.id }, notice: '文章を投稿しました' )
    else
      redirect_to( { action: :edit }, notice: '文章の投稿に失敗しました' )
    end
  end

  def show
    if user_signed_in? && current_user.rental == params[:id].to_i
      redirect_to action: :edit
    else
      @book = this_book
    end
  end

  def search
    sort = params[:sort] || "created_at DESC"
    
    if params[:keyword] == ""
      @search_title = "一覧表示"
    else
      @search_title = "#{params[:keyword]}の検索結果"
    end
    
    @books = Book.search(params[:keyword]).order(sort)
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
      redirect_to( { action: :show }, notice: 'この本はあなたより先に別のユーザーに貸し出されました' )
    elsif current_user.rental == 0
      rental_book
      redirect_to action: :edit
    else
      rental_swap
      redirect_to action: :edit
    end
  end

  def return
    @book = this_book
    @book.record_timestamps = false
    rental_reset
    redirect_to( { action: :show, id: @book.id }, notice: '本を返却しました' )
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

end
