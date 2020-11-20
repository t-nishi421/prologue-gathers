class TextsController < ApplicationController

  def update
    @my_story = Text.find(params[:id])
    @my_story.text = params[:new_text]
    @update_bool = @my_story.save
  end
end
