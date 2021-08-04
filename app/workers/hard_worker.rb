class HardWorker
  include Sidekiq::Worker

  def perform(current_user_id)
    User.admins.each do |admin|
      UserMailer.admin_panel_email(admin.id, current_user_id).deliver_now
    end
  end
end
