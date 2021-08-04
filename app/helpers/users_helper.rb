module UsersHelper

  def assign_user_role(role)
    self.roles.delete_all if self.roles
    self.add_role(role)
    puts 'user'
  end

end
