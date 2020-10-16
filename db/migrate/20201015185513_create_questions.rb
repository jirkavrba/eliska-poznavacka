class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.integer :question_set_id
      t.string :image_url
      t.string :answer
      t.integer :viewed_times, default: 0
      t.integer :correctly_answered_times, default: 0

      t.timestamps
    end
  end
end
