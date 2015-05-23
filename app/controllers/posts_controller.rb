class PostsController < ApplicationController
  respond_to :json, only: :get_meta
  def index
    @influencers = Influencer.all.sort_by(&:last_post_time_ago).first 5
    # @first_post_meta = MetaInspector.new(@last_posts.first[:href])
  end

  def get_meta
    @meta = MetaInspector.new(params[:href])
  end
end
