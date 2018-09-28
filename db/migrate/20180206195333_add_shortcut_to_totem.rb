class AddShortcutToTotem < ActiveRecord::Migration[5.1]
  def change
    add_column :totems, :shortcut, :string
    add_index :totems, :shortcut, unique: true
  end
end
