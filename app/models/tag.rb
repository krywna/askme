class Tag < ApplicationRecord
  REGEX = (/#[\p{L}\d_]+/).freeze

  has_many :question_tags, dependent: :destroy
  has_many :questions, through: :question_tags

  scope :with_questions, -> { where_exists(:question_tags) }
end
