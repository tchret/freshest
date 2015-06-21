class PagesController < ApplicationController
  def about
    @sources = Source.all.reject { |source| source.last_post_at.nil? }.sort_by(&:last_post_at).reverse.first(5)
  end
end
