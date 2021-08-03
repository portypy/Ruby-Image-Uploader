class User < ApplicationRecord

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :role

  scope :admins, -> { where(role: 'admin') }


  Callbacks
  after_create :assign_default_role

  def assign_user_role(user_id, role)
    user = User.find(user_id)
    user.roles.delete_all if self.roles
    user.add_role(role)
    puts 'user'
  end

  def assign_default_role
    self.add_role(:user)
  end

end
