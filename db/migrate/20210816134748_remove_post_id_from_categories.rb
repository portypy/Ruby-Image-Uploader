class RemovePostIdFromCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, 'post_id'
  end
end
