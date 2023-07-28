class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :title, null:false

      t.timestamps
    end
    add_foreign_key("answers", "questions")
    add_foreign_key("questions", "tests")
    add_foreign_key("tests", "categories")
  end
end
