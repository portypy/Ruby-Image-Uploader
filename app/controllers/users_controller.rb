class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  def index
    @users = User.all
    authorize @users

    respond_to do |format|
      format.html
      format.csv { send_data @users.to_csv, filename: "users-#{Date.today}.csv" }
    end
  end

  def show
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

  def email_users_list
    HardWorker.new.perform(current_user.id)
    redirect_to users_path
  end
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.friendly.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit( :id, :name, :category_id, subcategory_ids: [])
  end
end
