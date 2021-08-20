class HardWorker
  include Sidekiq::Worker

  def perform(current_user_id)
    temp_file = Tempfile.new('users_list.csv')
    attributes = %w{ id email created_at updated_at }
    CSV.open( temp_file, 'w')  do |csv|
      csv << attributes
      User.all.each do |user|
        csv << user.attributes.values_at(*attributes)
      end
    end
    UserMailer.admin_panel_email(current_user_id, temp_file).deliver_now
    temp_file.close
    temp_file.delete
  end
end
