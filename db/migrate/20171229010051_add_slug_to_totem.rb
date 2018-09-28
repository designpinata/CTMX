class AddSlugToTotem < ActiveRecord::Migration[5.1]
  def change
    add_column :totems, :slug, :string, null: false
    add_index :totems, :slug, unique: true
  end
end
