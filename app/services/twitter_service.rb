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

  def get_last_tweet(user)
    i = 0
    timeline = ts.client.user_timeline("Lewagonparis", {include_rts: false})
    while timeline.size == 0
      i += 1
      timeline = ts.client.user_timeline("Lewagonparis", {include_rts: false, count: 20 + i})
    end
    last_tweet = timeline.first
    last_tweet.full_text
  end


end