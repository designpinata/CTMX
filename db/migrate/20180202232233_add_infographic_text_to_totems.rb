class AddInfographicTextToTotems < ActiveRecord::Migration[5.1]
  def change
    add_column :totems, :infographic_text, :string
  end
end
