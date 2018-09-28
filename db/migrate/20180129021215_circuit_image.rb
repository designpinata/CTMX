class CircuitImage < ActiveRecord::Migration[5.1]
  def change
    create_table :circuit_images do |t|
      t.attachment :image
      t.references :circuit, foreign_key: true

      t.timestamps
    end
  end
end
