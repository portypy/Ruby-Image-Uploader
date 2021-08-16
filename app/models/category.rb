class Category < ApplicationRecord

  has_and_belongs_to_many :posts
  has_many :subcategories, as: :categorizable

  # has_many :subcategories, class_name: 'Category', foreign_key: 'parent_id', dependent: :destroy
  # belongs_to :parent, class_name: 'Category', foreign_key: 'parent_id', optional: true

  # has_many :subcategories, :class_name => "Category", :foreign_key => "parent_id", :dependent => :destroy
  # belongs_to :parent_category, :class_name => "Category", :optional => true

  # belongs_to :categoryable, polymorphic: true
  # has_many :categories, as: :categoryable

  # belongs_to :parent, :class_name => 'Category'
  # has_many :children, :class_name => 'Category', :foreign_key => 'parent_id'
  #
  # scope :top_level, where(:parent_id => nil)

end
