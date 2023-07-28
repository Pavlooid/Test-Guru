class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.string :question, null: false
      t.integer :test_id, foreign_key: true, null: false

      t.timestamps
    end
  end
end
