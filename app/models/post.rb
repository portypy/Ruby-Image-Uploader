class Post < ApplicationRecord

  mount_uploader :image, AvatarUploader

  has_many :comments, dependent: :delete_all

end
