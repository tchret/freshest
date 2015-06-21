class ApisController < ApplicationController
  respond_to :json, only: [:reading_list, :index_sources]

  def reading_list
    @user = User.where(twitter_id: params[:id])[0]
    if @user
      @influencers = @user.all_follows.map {|subscription| Influencer.find(subscription.followable_id)}.reject { |influencer| influencer.last_post_at.nil? }.sort_by(&:last_post_at).reverse.first(5)
    else
      @influencers = false
    end
  end

  def index_sources
    @influencers = Influencer.all
  end
end
