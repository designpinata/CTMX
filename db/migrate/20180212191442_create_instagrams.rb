class CreateInstagrams < ActiveRecord::Migration[5.1]
  def change
    create_table :instagrams do |t|
      t.string :user_name
      t.string :user_username
      t.string :user_picture_url
      t.string :image_url
      t.integer :likes
      t.integer :comments
      t.references :totem, foreign_key: true

      t.timestamps
    end
  end
end
