class UserMailer < ApplicationMailer
  default from: "notitications@example.com"

  def admin_panel_email(user_id, current_user_id)
    @user = User.find(user_id)
    @current_user = User.find(current_user_id)
    mail(to: @user.email, subject: 'Someone viewed admin panel')
  end
end
