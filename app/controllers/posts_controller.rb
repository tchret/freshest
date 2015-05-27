class PostsController < ApplicationController
  respond_to :json, only: :get_meta
  def index
    @influencers = Influencer.all.reject { |influencer| influencer.class != Time }.sort_by(&:last_post_at).reverse
    # @first_post_meta = MetaInspector.new(@last_posts.first[:href])
    raise
  end

  def get_meta
    @influencers = Influencer.all.reject { |influencer| influencer.last_post_at.nil? }.sort_by(&:last_post_at).reverse
    # @first_post_meta = MetaInspector.new(@last_posts.first[:href])
  end

  def get_meta
    @meta = MetaInspector.new(params[:href])
  end
end
