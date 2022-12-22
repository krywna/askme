module QuestionsHelper
  def render_with_hashtags(body)
    body.gsub(/#\w+/){|htag| link_to htag, "/questions/hashtag/#{htag.delete("#")}"}.html_safe
  end
end
