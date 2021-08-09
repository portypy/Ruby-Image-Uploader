class UserPolicy < ApplicationPolicy

  def index?
    if (@user)
      @user.has_role? :admin
    end
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
