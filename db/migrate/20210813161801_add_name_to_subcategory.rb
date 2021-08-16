class AddNameToSubcategory < ActiveRecord::Migration[5.2]
  def change
    add_column :subcategories, :name, :string
  end
end
