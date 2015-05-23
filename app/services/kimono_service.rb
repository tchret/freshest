require 'rest-client'

class KimonoService
  attr_reader :response

  def initialize
  end

  def raw_list
    @response["results"]["collection1"]
  end

  def last_posts(data_path)
    clean_list = clean_list(data_path)
    post_list(clean_list)
  end

  private

  def post_list(data_path)
    data_path.reduce(Array.new) do |array, tweet_from_kimono|
      last_post = LastPost.new(tweet_from_kimono).generate
      array << last_post
    end
  end

  def clean_list(list)
    list_without_doubloon = remove_doubloon(list)
    list_without_retweet = remove_retweet(list_without_doubloon)
    list_without_link = remove_link(list_without_retweet)
    remove_conversation(list_without_link)
  end

  def remove_link(list)
    list.reject { |t| t["link"].class != Array }
  end

  def remove_doubloon(list)
    list.uniq { |t|  t["username"]["text"]}
  end

  def remove_conversation(list)
    list.reject { |t| t["small_link"]["text"] == "View conversation" }
  end

  def remove_retweet(list)
    list.select do |t|
      Influencer.exists?(:twitter_id => t["username"]["text"])
    end
  end
end