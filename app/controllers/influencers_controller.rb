class InfluencersController < ApplicationController
  def index
   @influencers = Influencer.all.reject {|influencer| influencer.avatar_url == nil}
  end

  def follow
    influencer = Influencer.where(twitter_id: params[:id])[0]
    current_user.follow(influencer)
    render nothing: true
  end

  def stop_following
    influencer = Influencer.where(twitter_id: params[:id])[0]
    current_user.stop_following(influencer)
    render nothing: true
  end

  private

  def influencer_params
    params.require(:influencer).permit(:twitter_id)
  end
end
