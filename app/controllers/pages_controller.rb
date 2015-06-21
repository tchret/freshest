class PagesController < ApplicationController
  def about
    @influencers = Influencer.all.reject { |influencer| influencer.last_post_at.nil? }.sort_by(&:last_post_at).reverse.first(5)
  end
end
