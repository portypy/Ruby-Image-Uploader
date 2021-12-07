class AddFieldsToInstaItems < ActiveRecord::Migration[5.2]
  def change
    add_column :insta_items, :insta_id, :varchar
    add_column :insta_items, :caption, :string
    add_column :insta_items, :media_type, :string
    add_column :insta_items, :thumbnail_url, :string
    add_column :insta_items, :timestamp, :string
  end
end
