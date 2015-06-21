class ApisController < ApplicationController
  respond_to :json, only: [:reading_list, :index_sources]

  def reading_list
    @user = User.where(twitter_id: params[:id])[0]
    if @user
      @sources = @user.all_follows.map {|subscription| Source.find(subscription.followable_id)}.reject { |source| source.last_post_at.nil? }.sort_by(&:last_post_at).reverse.first(5)
    else
      @sources = false
    end
  end

  def index_sources
    @sources = Source.all
  end
end
