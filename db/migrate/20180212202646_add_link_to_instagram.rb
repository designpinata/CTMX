class AddLinkToInstagram < ActiveRecord::Migration[5.1]
  def change
    add_column :instagrams, :link, :string
  end
end
