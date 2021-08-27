class PostPolicy < ApplicationPolicy

  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def index?
    true
  end

  def edit?
    if user
      (user.has_role? :mod) || (user.has_role? :admin) || (user.id == @post.user_id)
    end
  end

  def update?
    if user
      (user.has_role? :mod) || (user.has_role? :admin) || (user.id == @post.user_id)
    end
  end

  def new?
    if user
      true
    end
  end

  def create?
    if user
      true
    end
  end

  def destroy?
    if user
      (user.has_role? :admin) || (user.id == @post.user_id)
    end
  end
  # class Scope < Scope
  #   def resolve
  #     scope.all
  #   end
  # end
end
