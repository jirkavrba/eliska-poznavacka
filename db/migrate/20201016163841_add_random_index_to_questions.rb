class AddRandomIndexToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :random_index, :integer
  end
end
