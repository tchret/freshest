require 'open-uri'
require 'nokogiri'

class PostsController < ApplicationController
  def index
    @posts = Influencer.all.reduce(Array.new) do |array, influencer|
      parsing = Parsing.new(influencer)
      post = Post.find_or_create_by(content: parsing.freshest_post, influencer: influencer)
      array << post
    end
  end
end