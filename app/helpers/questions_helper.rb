module QuestionsHelper
  def render_with_hashtags(text)
    text.gsub(/#[\wА-Яа-я\-]+/i){|htag| link_to htag, "/questions/hashtag/#{htag.delete("#")}"}.html_safe
  end
end
