class AddNotNullMigration < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:tests, :title, false)
    change_column_null(:tests, :level, false)
    change_column_null(:tests, :category_id, false)
    change_column_null(:questions, :title, false)
    change_column_null(:questions, :test_id, false)
    change_column_null(:answers, :body, false)
    change_column_null(:answers, :question_id, false)
    change_column_null(:users, :first_name, false)
    change_column_null(:users, :last_name, false)
    change_column_null(:users, :email, false)
    change_column_null(:users, :username, false)
    change_column_null(:categories, :title, false)
    add_column(:questions, :question, :string, null: false)
    add_foreign_key("answers", "questions")
    add_foreign_key("questions", "tests")
    add_foreign_key("tests", "categories")
  end
end
