class Question < ApplicationRecord
  has_many :question_tags, dependent: :delete_all
  has_many :tags, through: :question_tags

  belongs_to :user
  belongs_to :author, class_name: "User", optional: true

  validates :body, presence: true, length: { maximum: 280 }

  after_commit :set_tags, on: %i[ create update ]

  def set_tags
    self.tags.clear
    self.tags =
      "#{body} #{answer}".downcase.scan(Tag::REGEX).uniq.map do |hashtag|
        Tag.find_or_create_by(name: hashtag.downcase.delete("#"))
      end
  end
end
