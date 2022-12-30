class Question < ApplicationRecord
  has_many :question_tags, dependent: :delete_all
  has_many :tags, through: :question_tags

  belongs_to :user
  belongs_to :author, class_name: "User", optional: true

  validates :body, presence: true, length: { maximum: 280 }

  after_commit :set_tags

  def set_tags
    self.tags.clear
    hashtags = self.body.gsub(/#[\p{L}_\d]+/)
    hashtags += self.answer.gsub(/#[\p{L}_\d]+/) if self.answer.present?
    hashtags.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete("#"))
      self.tags << tag
    end
  end

end
