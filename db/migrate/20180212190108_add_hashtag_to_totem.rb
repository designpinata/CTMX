class AddHashtagToTotem < ActiveRecord::Migration[5.1]
  def change
    add_column :totems, :hashtag, :string
  end
end
