require 'open-uri'
require 'nokogiri'

class InfluencersController < ApplicationController
  before_action :authenticate_user!, only: :create

  def index
    @influencers = Influencer.all
  end

  def show
    influencer = Influencer.where(twitter_id: params[:id])[0]
    parsing = Parsing.new(influencer)
    @post = Post.find_or_create_by(content: parsing.freshest_post, influencer: influencer)
  end

  def create
    @influencer = Influencer.new(influencer_params)
    parsing = Parsing.new(influencer)
    twitter_profile = parsing.get_twitter_profile
    @influencer.name = twitter_profile.search('.ProfileHeaderCard-nameLink').text
    if @influencer.save
      @post = Post.new
      @post.influencer = @influencer
      @post.content = twitter_profile.search('.ProfileTweet-text').first
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
end
