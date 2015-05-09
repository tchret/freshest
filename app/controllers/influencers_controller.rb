require 'open-uri'
require 'nokogiri'

class InfluencersController < ApplicationController
  before_action :authenticate_user!, only: :create
  before_action :initialize_service

  def index
    @influencers = Influencer.all
  end

  def show
    influencer = Influencer.where(twitter_id: params[:id])[0]
    twitter_service = TwitterService.new
    twitter_user = twitter_service.client.user(influencer.twitter_id)
    @post = Post.find_or_create_by(
      content: twitter_service.get_last_tweet(influencer.twitter_id).full_text,
      influencer: influencer,
      image_url: twitter_user.profile_image_url.to_s.gsub('normal', '400x400')
    )
  end

  def create
    @influencer = Influencer.new(influencer_params)
    last_tweet = @twitter_service.get_last_tweet(influencer.twitter_id)
    if @influencer.save
      @post = Post.new(
        influencer: @influencer,
        content: last_tweet.full_text
      )
      @post.save
      redirect_to 'posts/index'
    else
      redirect_to :back
    end
  end

  private

  def influencer_params
    params.require(:influencer).permit(:twitter_id)
  end

  def initialize_service
    @twitter_service = TwitterService.new
  end
end
