class TagsController < ApplicationController
  def show
    @tag = Tag.find_by_name!(params[:name])
    @questions_with_tag = @tag.questions
  end
end
