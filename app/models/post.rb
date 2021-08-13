class Post < ApplicationRecord

  mount_uploader :image, AvatarUploader

  has_many :comments, dependent: :delete_all

  searchkick word_start: [:title]

  def search_data
    {
      title: title,

    }
  end
end
