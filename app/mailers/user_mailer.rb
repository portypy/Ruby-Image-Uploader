class UserMailer < ApplicationMailer
  default from: "notitications@example.com"

  def admin_panel_email(user_id, current_user)

    @user = User.find(user_id)
    @current_user = User.find(current_user)
    # @admins = User.admins
    mail(to: @user.email, subject: 'Someone viewed admin panel')
  end
end
