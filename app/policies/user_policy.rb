class UserPolicy < ApplicationPolicy


  def index?
    if user
      user.has_role? :admin
    end
  end

  def show?
    if user
      user.has_role? :admin
    end
  end

  def assign_user_role?
    if user
      user.has_role? :admin
    end
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
