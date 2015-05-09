class PostsController < ApplicationController
  before_action :initialize_service, only: :index
  def index
    if need_update?
    @twitter_service.get_last_from_list('freshst-dev').reduce(@last_tweets = Array.new) do |array, tweet|
      influencer = Influencer.find_by(twitter_id: "#{tweet.user.user_name}")
      influencer.update_avatar(tweet.user.profile_image_url.to_s.gsub('normal', '400x400'))
      @last_tweets << {tweet: tweet, influencer: influencer}

    else
      # use back end
    end
    end
  end

  private

  def need_update?
    true
  end

  def initialize_service
    @twitter_service = TwitterService.new
  end

end
