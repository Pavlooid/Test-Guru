class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :rules do |t|
      t.string :body, unique: true, null: false

      t.timestamps
    end

    create_table :badges do |t|
      t.string :name, unique: true
      t.string :badge_photo_url
      t.string :description
      t.references :rule, foreign_key: true

      t.timestamps
    end
  end
end
