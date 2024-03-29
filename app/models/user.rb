class User < ApplicationRecord

  validates :email, presence: true , uniqueness: true

  extend FriendlyId
  friendly_id :email, use: :slugged

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :role
  has_many :posts


  scope :admins, -> { joins(:users_roles).where('role_id = ?', '2') }

  #Callbacks
  after_create :assign_default_role

  def assign_default_role
    self.add_role(:user)
  end

  def self.to_csv
    attributes = %w{ id email created_at updated_at }
    CSV.generate(headers: true ) do |csv|
      csv << attributes
      all.each do |user|
        csv << user.attributes.values_at(*attributes)
      end
    end
  end
end
