class Question < ApplicationRecord
  belongs_to :question_set

  validates :image_url, presence: true
  validates :answer, presence: true

  def success_ratio
    return 0 if self.correctly_answered_times == 0
    
    (self.correctly_answered_times + self.incorrectly_answered_times) / self.correctly_answered_times
  end
end
