class UserMailer < ApplicationMailer
  default from: "notifications@example.com"

  def admin_panel_email(current_user_id, temp_file)
    @user = User.find(current_user_id)
    attachments['Users list'] = File.read(temp_file)
    mail(to: @user.email, subject: "Image Uploader's Users List")
  end
end
