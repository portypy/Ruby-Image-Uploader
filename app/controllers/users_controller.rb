class UsersController < ApplicationController
  def index
    @users = User.all
    HardWorker.
      perform_async(params[:id], current_user)
  end

  def show
    @user = User.find(params[:id])
    @roles_array = %w[ mod,   user, admin]

  end

end
