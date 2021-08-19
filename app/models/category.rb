class Category < ApplicationRecord

  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :posts
  has_and_belongs_to_many :subcategories


end

