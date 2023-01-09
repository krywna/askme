class Tag < ApplicationRecord
  REGEX = (/#[\p{L}\d_]+/).freeze
  cattr_reader :regex

  has_many :question_tags
  has_many :questions, through: :question_tags
end
