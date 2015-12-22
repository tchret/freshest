class PostsController < ApplicationController
  respond_to :json, only: :page
  include CrispHelper

  def index
    if user_signed_in?
      @sources = current_user.fresh_sources
      @sources = Kaminari.paginate_array(@sources).page(params[:page]).per(5)
    else
      @sources = Source.all.order(last_post_at: :desc).reject { |source| source.last_post_at.nil? || !source.in_starting_pack? || !source.title || !source.description || source.description == "" }
      @sources = Kaminari.paginate_array(@sources).page(params[:n]).per(5)
    end
  end

  def page
    if user_signed_in?
      sources = current_user.fresh_sources
      @sources = Kaminari.paginate_array(sources).page(params[:n]).per(5)
    else
      @sources = Source.all.order(last_post_at: :desc).reject { |source| source.last_post_at.nil? || !source.in_starting_pack? || !source.title || !source.description || source.description == ""}
      @sources = Kaminari.paginate_array(@sources).page(params[:n]).per(5)
    end
  end
end
