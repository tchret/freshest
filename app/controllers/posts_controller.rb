class PostsController < ApplicationController
  before_action :initialize_kimono_service, only: :index
  def index
    @fresh_tweet = @kimono_service.fresh_tweets
  end

  private

  def initialize_twitter_service
    @twitter_service = TwitterService.new
  end

  def initialize_kimono_service
    @kimono_service = KimonoService.new
  end

end
