require 'rest-client'

class KimonoService
  attr_reader :response

  def initialize
    RestClient.post "https://www.kimonolabs.com/kimonoapis/8b6fnvc4/startcrawl", apikey: "zj0UIbRDN9o2vsuGGQpVztNcFI9Udzch"
    @response = JSON.parse(RestClient.get 'https://www.kimonolabs.com/api/8b6fnvc4?apikey=zj0UIbRDN9o2vsuGGQpVztNcFI9Udzch')
  end

  def raw_list
    @response["results"]["collection1"]
  end

  def fresh_tweets
    clean_list(tweet_list)
  end


  private


  def tweet_list
    @response["results"]["collection1"].reduce(Array.new) do |array, tweet_from_kimono|
      tweet = Tweet.new(tweet_from_kimono).generate
      array << tweet
    end
  end


  def clean_list(list)
    fresh_list = remove_retweet(list)
    remove_doubloon(fresh_list)
  end

  def remove_doubloon(list)
    list.uniq do |tweet|
      tweet[:user_id]
    end
  end

  def remove_retweet(list)
    list.select do |tweet|
      tweet[:retweet]
    end
  end


end