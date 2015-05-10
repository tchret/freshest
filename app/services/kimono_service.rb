require 'rest-client'

class KimonoService
  attr_reader :response
  def initialize
    @response = JSON.parse(RestClient.get 'https://www.kimonolabs.com/api/8b6fnvc4?apikey=zj0UIbRDN9o2vsuGGQpVztNcFI9Udzch')
  end

  def list_tweets
    @response["results"]["collection1"]
  end

  def list_fresh_tweets
    list_tweets.select do |tweet|
      tweet["retweet"]["href"].blank?
    end
  end


end