class AddNotNullMigration < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:tests, :title, false)
    change_column_null(:tests, :level, false)
    change_column_null(:questions, :title, false)
    change_column_null(:answers, :body, false)
    change_column_null(:users, :first_name, false)
    change_column_null(:users, :last_name, false)
    change_column_null(:users, :email, false)
    change_column_null(:users, :username, false)
    change_column_null(:categories, :title, false)
  end

  def up
    change_column_default(:tests, :level, 0)
    change_column_default(:answers, :correct, :boolean, true)
  end

  def down
    change_column_default(:answers, :correct, :boolean, nil)
  end
end
