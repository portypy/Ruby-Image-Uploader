class UsersController < ApplicationController

  def index
    @users = User.all
    authorize @users
    HardWorker.new.perform(current_user.id)
  end

  def show
    @user = User.find(params[:id])
    @roles_array = %w[ admin mod  user  ]
    authorize @user
  end

  def assign_user_role
    @user = User.find(params[:id])
    @user.roles.delete_all if @user.roles
    @user.add_role(params[:role])
    redirect_to @user, notice: "#{@user.email} was given the role of #{@user.roles.first.name if @user.roles.any?}"
  end

end
