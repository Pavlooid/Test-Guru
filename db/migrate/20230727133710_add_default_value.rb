class AddDefaultValue < ActiveRecord::Migration[6.0]
  def up
    change_column_default(:tests, :level, 0)
    change_column_default(:answers, :correct, true)
  end
end
