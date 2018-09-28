class AddShortcutToCircuit < ActiveRecord::Migration[5.1]
  def change
    add_column :circuits, :shortcut, :string
    add_index :circuits, :shortcut, unique: true
  end
end
