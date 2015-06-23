class PostsController < ApplicationController
  def index
    if user_signed_in?
      @sources = current_user.all_follows.map {|subscription| Source.find(subscription.followable_id)}
      @sources.delete_if {|source| source.last_post_at.nil? || ((Time.now.to_i - source.last_post_at.to_time.to_i) / 60) > current_user.crisp_average}
      @sources.sort_by(&:last_post_at).reverse
      # @array =  Kaminari.paginate_array(@sources).page(params[:page]).per(source_count)
    else
      @sources = Source.all.reject { |source| source.last_post_at.nil? }.sort_by(&:last_post_at).reverse.first(5)
    end
  end

  def get_old_sources
    @sources = current_user.all_follows.map {|subscription| Source.find(subscription.followable_id)}
    @sources.delete_if {|source| source.last_post_at.nil? || ((Time.now.to_i - source.last_post_at.to_time.to_i) / 60) > current_user.crisp_average }
    @sources.size /
    @sources.sort_by(&:last_post_at).reverse[params[:count]..-1]
  end
end
