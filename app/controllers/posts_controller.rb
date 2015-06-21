class PostsController < ApplicationController
  def index
    if user_signed_in?
      @influencers = current_user.all_follows.map {|subscription| Influencer.find(subscription.followable_id)}.reject { |influencer| influencer.last_post_at.nil? }.sort_by(&:last_post_at).reverse.first(5)
    else
      @influencers = Influencer.all.reject { |influencer| influencer.last_post_at.nil? }.sort_by(&:last_post_at).reverse.first(5)
    end
  end
end
