class PostsController < ApplicationController
  def index
    @fresh_tweet = IndexData.new.generate
  end
end
