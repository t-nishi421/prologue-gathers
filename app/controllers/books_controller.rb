class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(params.require(:book).permit(:title).merge(user_id: current_user.id))
    @book.color = "white"
    @book.save

    @text = Text.new(params.require(:book).permit(:chapter, :text).merge(user_id: current_user.id, book_id: @book.id))
    @text.save
    redirect_to root_path
  end

  def edit
  end

  def update
  end

  def show
    @book = this_book
  end

  def rental
    if current_user.rental == 0
      @book = this_book
      @book.rental = 1
      @book.save

      @user = User.find(current_user.id)
      @user.rental = @book.id
      @user.save
    end
    redirect_to root_path
  end

  private
  def this_book
    Book.find(params[:id])
  end

end

