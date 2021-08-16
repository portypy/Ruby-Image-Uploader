class Post < ApplicationRecord

  mount_uploader :image, AvatarUploader

  has_many :comments, dependent: :delete_all
  has_many :subcategories, as: :categorizable
  belongs_to :category
  searchkick word_start: [:title]

  def search_data
    {
      title: title,
    }
  end
end
