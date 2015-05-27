class PostsController < ApplicationController
  respond_to :json, only: :get_meta
  def index
    @influencers = Influencer.all.reject { |influencer| influencer.last_post_at.nil? }.sort_by(&:last_post_at).reverse
    # @first_post_meta = MetaInspector.new(@last_posts.first[:href])
  end

  def get_meta
    @influencer = Influencer.find_by(twitter_id: params[:twitter_id])
  end
end
