require 'open-uri'
require 'nokogiri'

class PostsController < ApplicationController
  def index
    @posts = Influencer.all.reduce(Array.new) do |array, influencer|
      twitter_path = influencer.twitter_id[1..-1]
      html_file = open("https://twitter.com/#{twitter_path}")
      html_doc = Nokogiri::HTML(html_file)
      freshest_post = html_doc.search('.ProfileTweet-text').first
      freshest_post.css('span.invisible').remove
      array << Post.find_or_create_by(content: freshest_post, influencer: influencer)
    end
  end
end
