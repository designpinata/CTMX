class CreateCircuits < ActiveRecord::Migration[5.1]
  def change
    create_table :circuits do |t|
      t.string :name
      t.string :subtitle
      t.attachment :header_image
      t.attachment :content_header_image
      t.string :content_title
      t.string :content_subtitle
      t.text :content
      t.timestamps
    end
  end
end
