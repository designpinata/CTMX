class AddSlugToPages < ActiveRecord::Migration[5.1]
  def change
    add_column :pages, :slug, :text
  end
end
