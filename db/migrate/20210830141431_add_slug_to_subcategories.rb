class AddSlugToSubcategories < ActiveRecord::Migration[5.2]
  def change
    add_column :subcategories, :slug, :string
  end
end
