class PostsController < ApplicationController
  respond_to :json, only: :get_meta
  def index
    @influencers = Influencer.all
    # @first_post_meta = MetaInspector.new(@last_posts.first[:href])
  end

  def get_meta
    @meta = MetaInspector.new(params[:href])
  end
end
