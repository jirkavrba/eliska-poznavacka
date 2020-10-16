class Question < ApplicationRecord
  belongs_to :question_set

  validates :image_url, presence: true
  validates :answer, presence: true

  def success_ratio
    return 0 if viewed_times.zero?

    correctly_answered_times.to_f / viewed_times
  end
end
