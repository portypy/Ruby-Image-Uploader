class RefreshInstaAccessToken
  include Sidekiq::Worker
  require 'mechanize'
  require 'net/http'
  require 'json'
  require 'faraday'

  def perform
    connection = Faraday.new
    @response = connection.get "https://graph.instagram.com/refresh_access_token?grant_type=ig_refresh_token&&access_token=#{ENV['INSTA_TOKEN']}"
    @new_token = JSON.parse(@response.body)["access_token"]
    ENV['INSTA_TOKEN'] = @new_token   # to check this with Martin
  end
end



#
# {
#   "access_token": "{access-token}",
#   "token_type": "{token-type}",
#   "expires_in": {expires-in}
# }