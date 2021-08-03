class HardWorker
  include Sidekiq::Worker

  def perform(current_user_id)
    User.admins.each do |user|
      UserMailer.admin_panel_email(user.id, current_user_id).deliver_now
    end
  end
end
