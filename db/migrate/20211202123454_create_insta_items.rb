class CreateInstaItems < ActiveRecord::Migration[5.2]
  def change
    create_table :insta_items do |t|
      t.string :media_url
      t.string :permalink
      t.string :extra_id

      t.timestamps
    end
  end
end
