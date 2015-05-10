class PostsController < ApplicationController
  def index
    @fresh_tweets = IndexData.new.generate
  end
end
