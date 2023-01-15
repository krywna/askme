class Question < ApplicationRecord
  has_many :question_tags, dependent: :destroy
  has_many :tags, through: :question_tags

  belongs_to :user
  belongs_to :author, class_name: "User", optional: true

  validates :body, presence: true, length: { maximum: 280 }

  after_save_commit :set_tags

  def set_tags
    self.tags =
      "#{@clean_text}".downcase.scan(Tag::REGEX).uniq.map do |hashtag|
        Tag.create_or_find_by(name: hashtag.downcase.delete("#"))
      end
  end
end
