class UsersController < ApplicationController
  def index
    @users = User.all
    # @user = User.find_by_id(params[:id])

  end

  def show
    @user = User.find(params[:id])
    @roles_array = %w[ mod,   user, admin]

  end

end
