json.extract! insta_item, :id, :media_url, :permalink, :extra_id, :created_at, :updated_at
json.url insta_item_url(insta_item, format: :json)
