class PostsController < ApplicationController
  respond_to :json, only: :page
  def index
    if user_signed_in?
      @sources = current_user.all_follows.map {|subscription| Source.find(subscription.followable_id)}.reject { |source| source.last_post_at.nil?  }.sort_by(&:last_post_at).reverse.first(16)
      @sources = Kaminari.paginate_array(@sources).page(params[:page]).per(5)
    else
      @sources = Source.all.order(last_post_at: :desc).reject { |source| source.last_post_at.nil? || source.user.twitter_id != "frshst" }
      @sources = Kaminari.paginate_array(@sources).page(params[:n]).per(5)
    end
  end

  def page
    if user_signed_in?
      sources = current_user.all_follows.map {|subscription| Source.find(subscription.followable_id)}.reject { |source| source.last_post_at.nil?  }.sort_by(&:last_post_at).reverse.first(16)
      @sources = Kaminari.paginate_array(sources).page(params[:n]).per(5)
    else
      @sources = Source.all.order(last_post_at: :desc).reject { |source| source.last_post_at.nil? || source.user.twitter_id != "frshst" }
      @sources = Kaminari.paginate_array(@sources).page(params[:n]).per(5)
    end
  end
end
