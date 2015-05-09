require 'open-uri'
require 'nokogiri'

class PostsController < ApplicationController
  before_action :initialize_service, only: :index
  def index
    @tweets_with_user = Influencer.all[0..1].reduce(Array.new) do |array, influencer|
      last_tweet = @twitter_service.get_last_tweet(influencer.twitter_id)
      twitter_user = @twitter_service.client.user(influencer.twitter_id)
      array << {user: twitter_user, tweet: last_tweet, influencer: influencer}
    end
  end

  private

  def initialize_service
    @twitter_service = TwitterService.new
  end
end
