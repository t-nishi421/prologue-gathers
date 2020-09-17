class UsersController < ApplicationController

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to( { action: :show }, notice: 'ユーザ情報を更新しました' )
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @count_book = Book.number_of_books_for_user(params[:id])
    @count_text = Text.number_of_texts_for_user(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :image)
  end
end
