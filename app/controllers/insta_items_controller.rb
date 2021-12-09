class InstaItemsController < ApplicationController

  # GET /insta_items or /insta_items.json
  def index
    @insta_items = InstaItem.all.order(timestamp: :desc)
    @insta_images = InstaItem.images
    @insta_videos = InstaItem.videos
  end

    # Only allow a list of trusted parameters through.
    def insta_item_params
      params.require(:insta_item).permit(:media_url, :permalink, :extra_id)
    end
end
