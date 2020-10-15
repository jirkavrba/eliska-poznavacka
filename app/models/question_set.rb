# frozen_string_literal: true
class QuestionSet < ApplicationRecord
  has_many :questions

  validates :name, presence: true
end
