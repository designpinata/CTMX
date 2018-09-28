class AddApprovedToInstagram < ActiveRecord::Migration[5.1]
  def change
    add_column :instagrams, :approved, :boolean, default: false
  end
end
