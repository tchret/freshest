class PostsController < ApplicationController
  def index
    @last_posts = IndexData.new.generate
  end
end
