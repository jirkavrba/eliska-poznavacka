class Question < ApplicationRecord
  belongs_to :question_set

  validates :name, presence: true
end
