class AddManualAddressToTotem < ActiveRecord::Migration[5.1]
  def change
    add_column :totems, :manual_address, :text
  end
end
