class User < ApplicationRecord

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :role

  scope :admins, -> { joins(:users_roles).where('role_id = ?', '5') }

  #Callbacks
  after_create :assign_default_role

  def assign_default_role
    self.add_role(:user)
  end

  def is_admin?
    self.has_role? :admin
  end

end
