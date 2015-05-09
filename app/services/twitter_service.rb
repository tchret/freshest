class TwitterService
  attr_reader :client

  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['TWITTER_KEY']
      config.consumer_secret = ENV['TWITTER_SECRET']
      config.access_token = ENV['TWITTER_TOKEN']
      config.access_token_secret = ENV['TWITTER_TOKEN_SECRET']
    end
  end

  def get_last_tweet(user_name)
    i = 0
    timeline = @client.user_timeline(user_name, {include_rts: false})
    while timeline.size == 0
      i += 1
      timeline = @client.user_timeline(user_name, {include_rts: false, count: 20 + i})
    end
    last_tweet = timeline.first
  end

end