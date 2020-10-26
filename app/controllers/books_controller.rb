class BooksController < ApplicationController
  def index
    @books = Book.all.order(id: "DESC")
  end

  def new
    @book = Book.new
    @colors = Color.all
    @icons = Icon.all
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
    @books = Book.search(params[:keyword]).order(id: "DESC")
    render action: :index
  end

  def search_userid
    @books = Book.search_userid(params[:id]).order(id: "DESC")
    render action: :search
  end

  def rental
    @path = Rails.application.routes.recognize_path(request.referer)

    if User.rental_status(this_book.id) == "can_not_rental"
      redirect_to( { action: :show }, notice: 'この本はあなたより先に別のユーザーに貸し出されました' )
    elsif current_user.rental == 0
      rental_book
      redirect_to action: :edit
    elsif @path[:action] == "rental"
      rental_swap
      redirect_to action: :edit
    else
      @rental_book = Book.find(current_user.rental)
      @book = this_book
      flash.now[:notice] = '貸出中の本があります'
    end
  end

  def return
    @book = this_book
    rental_reset
    redirect_to action: :index
  end

  def save_sentence
    @sentence = steal_sentence_params
    if @sentence.valid? && @sentence.save
    end
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
    StealSentence.new(params.permit(:sentence).merge(user_id: current_user.id, text_id: params[:text_id]))
  end

  def rental_book
    @book = this_book
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
    @rental_book.rental = 0
    @rental_book.save
    rental_book
  end

end
