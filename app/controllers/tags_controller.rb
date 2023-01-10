class TagsController < ApplicationController

  def show
    @tag = Tag.find_by(name: params[:name].delete("#"))
    if @tag.present?
      @questions_with_tag = @tag.questions.uniq
    else
      redirect_to root_path, notice: "Такого хэштэга нет!"
    end
  end
end
