class PostsController < ApplicationController
  respond_to :json, only: :get_meta
  def index
    @last_posts = IndexData.new.generate
  end

  def get_meta
    @meta = MetaInspector.new(params[:href])
  end
end
