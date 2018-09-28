class TotemImage < ActiveRecord::Migration[5.1]
  def change
    create_table :totem_images do |t|
      t.attachment :image
      t.references :totem, foreign_key: true

      t.timestamps
    end
  end
end
