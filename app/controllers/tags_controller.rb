class TagsController < ApplicationController
  def show
    @tag = Tag.where_exists(:questions).find_by!(name: params[:name])
    @questions_with_tag = @tag.questions
  end
end
