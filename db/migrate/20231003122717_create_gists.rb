class CreateGists < ActiveRecord::Migration[6.0]
  def change
    create_table :gists do |t|
      t.references :question, foreign_key: true, null: false
      t.string :url
      t.string :email_of_author
      
      t.timestamps
    end
  end
end
