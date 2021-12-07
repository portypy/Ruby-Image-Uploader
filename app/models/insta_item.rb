class InstaItem < ApplicationRecord

  validates :insta_id, uniqueness: true rescue nil

end
