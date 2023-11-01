class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :name, unique: true
      t.string :badge_photo_url
      t.string :rules
      t.timestamps
    end
  end
end
