class AddSlugToCircuits < ActiveRecord::Migration[5.1]
  def change
    add_column :circuits, :slug, :string, null: false
    add_index :circuits, :slug, unique: true
  end
end
