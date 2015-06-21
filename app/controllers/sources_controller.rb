class SourcesController < ApplicationController
  def index
   @sources = Source.all.reject {|source| source.avatar_url == nil}
  end

  def show
    if user_signed_in?
      @sources = current_user.all_follows.map {|subscription| Source.find(subscription.followable_id)}.reject { |source| source.last_post_at.nil? }.sort_by(&:last_post_at).reverse.first(5)
      @source =  Source.where(twitter_id: params[:id])[0]
    else
      @sources = Source.all.reject { |source| source.last_post_at.nil? }.sort_by(&:last_post_at).reverse.first(5)
      @source =  Source.where(twitter_id: params[:id])[0]
    end
  end

  def follow
    source = Source.where(twitter_id: params[:id])[0]
    current_user.follow(source)
    render nothing: true
  end

  def stop_following
    source = Source.where(twitter_id: params[:id])[0]
    current_user.stop_following(source)
    render nothing: true
  end

  private

  def source_params
    params.require(:source).permit(:twitter_id)
  end
end
