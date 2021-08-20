class UsersController < ApplicationController

  def index
    @users = User.all
    authorize @users

    HardWorker.new.perform(current_user.id)

    respond_to do |format|
      format.html
      format.csv { send_data @users.to_csv, filename: "users-#{Date.today}.csv" }
    end
  end

  def show
    @user = User.friendly.find(params[:id])
    authorize @user
    @roles_array = %w[ admin mod  user  ]
  end

  def assign_user_role
    @user = User.friendly.find(params[:id])
    authorize @user
    @user.roles.delete_all if @user.roles
    @user.add_role(params[:role])
    redirect_to @user, notice: "#{@user.email} was given the role of #{@user.roles.first.name if @user.roles.any?}"
    end

end
