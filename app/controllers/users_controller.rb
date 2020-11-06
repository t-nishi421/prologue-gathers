class UsersController < ApplicationController

  def edit
  end

  def update
    user = current_user
    user.record_timestamps = false
    if user.update(user_params)
      redirect_to( { action: :show }, notice: 'ユーザ情報を更新しました' )
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @count_book = Book.number_of_books_for_user(params[:id])
    @count_text = Text.number_of_texts_for_user(params[:id])
    @count_steal_sentence = StealSentence.number_of_sentences_steal(params[:id])
    @count_stolen_sentence = StealSentence.number_of_sentences_stolen(params[:id])
  end

  def sentences
    @sentences = StealSentence.where(user_id: params[:id])
  end

  def delete_sentence
    StealSentence.find(params[:sentence_id]).delete
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :image)
  end
end
