class CreateTotems < ActiveRecord::Migration[5.1]
  def change
    create_table :totems do |t|
      t.string :name
      t.text :description
      t.attachment :main_image
      t.attachment :header_image
      t.attachment :infographic
      t.text :content
      t.string :location
      t.float :latitude
      t.float :longitude
      t.integer :position
      t.references :circuit, foreign_key: true

      t.timestamps
    end
  end
end
