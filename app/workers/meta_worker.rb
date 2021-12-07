class MetaWorker
  include Sidekiq::Worker
  require 'mechanize'
  require 'net/http'
  require 'json'
  require 'faraday'


  def perform
    connection = Faraday.new
    @response = connection.get "https://graph.instagram.com/v12.0/me?fields=media&access_token=#{ENV['INSTA_TOKEN']}"
    @ids = JSON.parse(@response.body)['media']['data']

    @new_ids = []
    @ids.each do |id|
      if InstaItem.where(:insta_id => id['id']).blank?
        @new_ids << id
      end
    end

    @new_ids.each do |id|
      con = Faraday.new
      @res = con.get "https://graph.instagram.com/#{id['id']}?fields=caption,media_type,permalink,thumbnail_url,media_url,timestamp&access_token=#{ENV['INSTA_TOKEN']}"
      @caption = JSON.parse(@res.body)['caption']
      @media_url = JSON.parse(@res.body)['media_url']
      @url = JSON.parse(@res.body)['permalink']
      @path = URI(@url).path
      @media_type = JSON.parse(@res.body)['media_type']
      if @media_type == 'VIDEO'
        @thumbnail_url = JSON.parse(@res.body)['thumbnail_url']
      else
        @thumbnail_url = nil
      end
      @timestamp = JSON.parse(@res.body)['timestamp']
      InstaItem.new({'permalink' => @path,
                     'media_url' => @media_url,
                     'caption' => @caption,
                     'media_type' => @media_type,
                     'timestamp' => @timestamp,
                     'thumbnail_url' => @thumbnail_url,
                     'insta_id' => id['id']}).save
    end
  end
end