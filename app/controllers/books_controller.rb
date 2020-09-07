class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
    @colors = Color.all
    @icons = Icon.all
  end

  def create
    @book = Book.new(params.require(:book).permit(:title).merge(user_id: current_user.id))
    @book.save

    create_text
    redirect_to root_path
  end

  def edit
    @book = Book.find(current_user.rental)
    if @book.completion == false
      @chapter = @book.texts.count + 1
    else
      redirect_to root_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if params[:book][:completion].to_i == 1
      @book.completion = params[:book][:completion].to_i
    end
    create_text

    @user = User.find(current_user.id)
    @book.rental = 0
    @book.save
    @user.rental = 0
    @user.save
    redirect_to root_path
  end

  def show
    if current_user.rental == params[:id].to_i
      redirect_to action: :edit
    else
      @book = this_book
    end
  end

  def search
    @books = Book.search(params[:keyword])
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
    @book.rental = 0
    @book.save

    @user = this_user
    @user.rental = 0
    @user.save
    redirect_to root_path
  end

  private
  def this_book
    Book.find(params[:id])
  end

  def this_user
    User.find(current_user.id)
  end

  def create_text
    Text.create(params.require(:book).permit(:chapter, :text).merge(user_id: current_user.id, book_id: @book.id))
  end

end
