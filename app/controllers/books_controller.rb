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
    @book = Book.find(current_user.rental)
    if @book.completion == false
      @chapter = @book.texts.count + 1
    else
      redirect_to action: :index
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
    if current_user.rental == params[:id].to_i
      redirect_to action: :edit
    else
      @book = this_book
    end
  end

  def search
    @books = Book.search(params[:keyword]).order(id: "DESC")
  end

  def rental
    if current_user.rental == 0
      @book = this_book
      @book.rental = 1
      @book.save

      @user = this_user
      @user.rental = @book.id
      @user.save
      redirect_to action: :edit
    else
      redirect_to({action: :show, id: params[:id]}, notice: '本の複数貸出しは出来ません')
    end
  end

  def return
    @book = this_book
    rental_reset
    redirect_to action: :index
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

  def rental_reset
    @user = this_user
    @book.rental = 0
    @book.save
    @user.rental = 0
    @user.save
  end

end
