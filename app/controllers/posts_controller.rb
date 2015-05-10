class PostsController < ApplicationController
  before_action :initialize_kimono_service, only: :index
  def index


    @kimono_service.list_fresh_tweets.reduce(@last_tweets = Array.new) do |array, tweet|
      tweet = {
        content: tweet["content"]["text"],
        href: tweet["link"].class == Array ? tweet["link"].first["href"] : false,
        user_image: tweet["avatar"]["src"].gsub('bigger', '400x400'),
        user_id: tweet["username"]["text"],
        user_name: tweet["full_name"]["text"]
      }
      @last_tweets << tweet
    end
  end

  private

  def initialize_twitter_service
    @twitter_service = TwitterService.new
  end

  def initialize_kimono_service
    @kimono_service = KimonoService.new
  end

end
