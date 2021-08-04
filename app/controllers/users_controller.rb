class UsersController < ApplicationController
  include UsersHelper
  def index
    @users = User.all
    HardWorker.new.perform(current_user.id)
  end

  def show
    @user = User.find(params[:id])
    @roles_array = %w[ mod, user, admin]
  end

end
