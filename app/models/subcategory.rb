class Subcategory < ApplicationRecord
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :posts
  searchkick
end
