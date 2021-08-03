class HardWorker
  include Sidekiq::Worker

  def perform(user_id)
    puts User.find(user_id).email + " just viewed admin panel"
  end
end
