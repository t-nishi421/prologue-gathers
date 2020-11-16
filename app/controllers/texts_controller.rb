class TextsController < ApplicationController

  def update
    @my_story = Text.find(params[:id])
    @my_story.text = params[:new_text]
    if @my_story.valid? && @my_story.save
    end
  end
end
