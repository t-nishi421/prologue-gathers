class BooksController < ApplicationController
  def index
    @book = Book.all
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
  end

  def edit
  end

  def update
  end

  def show
  end

end

