class TextsController < ApplicationController

  def update
    @my_story = Text.find(params[:id])
    # ここにupdate処理を入力
    redirect_to( { controller: :books, action: :show, id: @my_story.book_id } , notice: '編集を完了しました。' )
  end

end
