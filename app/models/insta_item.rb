class InstaItem < ApplicationRecord

  validates :insta_id, uniqueness: true rescue nil

  scope :videos, -> { where("media_type = ?", "VIDEO") }
  scope :images, -> { where("media_type = ?", "IMAGE") }

end
