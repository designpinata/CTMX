class CreatePolls < ActiveRecord::Migration[5.1]
  def change
    create_table :polls do |t|
      t.string :name
      t.string :email
      t.string :origin

      t.timestamps
    end
  end
end
