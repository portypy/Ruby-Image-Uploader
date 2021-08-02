class User < ApplicationRecord

  has_one :role

  # Callbacks
  # after_create :assign_user_role

  def assign_user_role(user_id, role)
    user = User.find(user_id)
    user.roles.delete_all if self.roles
    user.add_role(role)
    puts 'user'
  end

  # def assign_admin_role(user_id)
  #   # puts role_name
  #   user = User.find(user_id)
  #   user.roles.delete_all
  #   user.add_role(:role)
  #   puts 'admin'
  # end
  #
  # def assign_mod_role(user_id)
  #   user = User.find(user_id)
  #   user.roles.delete_all
  #   user.add_role(:mod)
  #   puts 'mod'
  # end

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
