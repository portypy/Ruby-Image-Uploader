class Subcategory < ApplicationRecord
  validates :name, presence: true , uniqueness: true
  validates_presence_of :categories
  searchkick

  extend FriendlyId
  friendly_id :name, use: :slugged

  has_and_belongs_to_many :categories
  has_and_belongs_to_many :posts

end
