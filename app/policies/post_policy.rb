class PostPolicy < ApplicationPolicy

  def index?
    true
  end

  def edit?
    if user
      (user.has_role? :mod) || (user.has_role? :admin)
    end
  end

  def update?
    if user
      user.has_role? :admin
    end
  end

  def create?
    if user
      user.has_role? :admin
    end
  end

  def destroy?
    if user
      user.has_role? :admin
    end
  end
  # class Scope < Scope
  #   def resolve
  #     scope.all
  #   end
  # end
end
