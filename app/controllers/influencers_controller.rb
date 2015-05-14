class InfluencersController < ApplicationController
  before_action :authenticate_user!, only: :create
  before_action :initialize_kimono_service, only: :show

  def show
    @influencer = Influencer.where(twitter_id: params[:id])[0]
    @last_posts = IndexData.new.generate
    @last_post = @last_posts.select {|post| post[:user_id] == @influencer.twitter_id}.first
  end

  def create
    @influencer = Influencer.new(influencer_params)
    last_tweet = @twitter_service.get_last_tweet(@influencer.twitter_id)
    @twitter_service.add_influencer_to_list('freshst-dev', @influencer.twitter_id)

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

  def initialize_kimono_service
    @kimono_service = KimonoService.new
  end
end
