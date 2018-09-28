class CreateTips < ActiveRecord::Migration[5.1]
  def change
    create_table :tips do |t|
      t.text :content
      t.integer :rate, default: 0
      t.boolean :approved, default: false
      t.references :totem, foreign_key: true

      t.timestamps
    end
  end
end
