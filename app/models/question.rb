class Question < ApplicationRecord
  has_many :question_tags
  has_many :tags, through: :question_tags
  belongs_to :user
  belongs_to :author, class_name: "User", optional: true

  validates :body, presence: true, length: { maximum: 280 }

  before_save :set_tags

  def set_tags
    self.tags.clear
    hashtags = self.body.scan(/#[\wА-Яа-я\-]+/i)
    hashtags += self.answer.scan(/#[\wА-Яа-я\-]+/i) if self.answer.present?
    hashtags.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete("#"))
      self.tags << tag
    end
  end

end
