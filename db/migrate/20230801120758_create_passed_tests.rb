class CreatePassedTests < ActiveRecord::Migration[6.0]
  def change
    create_table :passed_tests do |t|
      t.references :test, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.string :passed, null: false
      t.timestamps
    end
  end
end
