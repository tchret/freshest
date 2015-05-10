require 'rest-client'

class KimonoService
  attr_reader :response

  def initialize
  end

  def raw_list
    @response["results"]["collection1"]
  end

  def fresh_tweets(data_path)
    clean_list(tweet_list(data_path))
  end

  private

  def tweet_list(data_path)
    data_path.reduce(Array.new) do |array, tweet_from_kimono|
      tweet = Tweet.new(tweet_from_kimono).generate
      array << tweet
    end
  end

  def clean_list(list)
    list_without_doubloon = remove_doubloon(list)
    remove_retweet(list_without_doubloon)
  end

  def remove_doubloon(list)
    list.uniq { |tweet| tweet[:user_id] }
  end

  def remove_retweet(list)
    list.select do |t|
      Influencer.exists?(:twitter_id => t[:user_id])
    end
  end
end