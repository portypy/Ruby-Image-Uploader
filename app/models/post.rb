class Post < ApplicationRecord

  extend FriendlyId
  friendly_id :title, use: :slugged

  mount_uploader :image, AvatarUploader

  has_many :comments, dependent: :delete_all
  has_and_belongs_to_many :subcategories
  belongs_to :category
  belongs_to :user
  searchkick word_start: [:title]

  def search_data
    {
      title: title,
    }
  end
end
