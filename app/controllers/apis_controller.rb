class ApisController < ApplicationController
  respond_to :json, only: [:reading_list, :index_sources]

  def reading_list
    user = User.where(twitter_id: params[:id])[0]
    if user
      @influencers = user.all_follows.map do |follow|
        Influencer.find(follow.followable_id)
      end
    else
      @influencers = false
    end
  end

  def index_sources
    @influencers = Influencer.all
  end
end
