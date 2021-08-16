class Subcategory < ApplicationRecord
  belongs_to :categorizable, polymorphic: true
end
