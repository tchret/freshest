class PostsController < ApplicationController
  def index
    if user_signed_in?
      @sources = current_user.all_follows.map {|subscription| Source.find(subscription.followable_id)}.reject { |source| source.last_post_at.nil? }.sort_by(&:last_post_at).reverse.first(5)
    else
      @sources = Source.all.reject { |source| source.last_post_at.nil? }.sort_by(&:last_post_at).reverse.first(5)
    end
  end
end
