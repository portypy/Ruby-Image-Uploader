class Category < ApplicationRecord

  validates :name, presence: true , uniqueness: true

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  has_many :posts
  has_and_belongs_to_many :subcategories

  def slug_candidates
    [
      :name,
      :name, :created_at,
    ]
  end
end

