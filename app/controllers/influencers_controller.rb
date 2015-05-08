require 'open-uri'
require 'nokogiri'

class InfluencersController < ApplicationController
  before_action :authenticate_user!, only: :create

  def index
    @influencers = Influencer.all
  end

  def show
    @influencer = Influencer.find(params[:id])
  end

  def create
    @influencer = Influencer.new(influencer_params)
    twitter_path = @influencer.twitter_id[1..-1]
    html_file = open("https://twitter.com/#{twitter_path}")
    html_doc = Nokogiri::HTML(html_file)
    @influencer.name = html_doc.search('.ProfileHeaderCard-nameLink').text
    if @influencer.save
      @post = Post.new
      @post.influencer = @influencer
      @post.content = html_doc.search('.ProfileTweet-text').first
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
