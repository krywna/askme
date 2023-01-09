class QuestionTag < ActiveRecord::Base
  belongs_to :question, dependent: :destroy
  belongs_to :tag, dependent: :destroy
end
