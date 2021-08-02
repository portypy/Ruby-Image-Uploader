class PostPolicy < ApplicationPolicy

  def index?
    true
  end

  def edit?
    if user
      user.roles.each do |role|
        if role.name == "admin"
          return true
        else
          return false
        end
      end
    end
  end

  def update?
    if user
      user.roles.each do |role|
        if role.name == "admin"
          return true
        else
          return false
        end
      end
    end
  end

  def destroy?
    if user
      user.roles.each do |role|
        if role.name == "admin"
          return true
        else
          return false
        end
      end
    end
  end
  # class Scope < Scope
  #   def resolve
  #     scope.all
  #   end
  # end
end
