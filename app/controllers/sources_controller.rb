class SourcesController < ApplicationController
  def index
   @sources = Source.all.reject {|source| source.avatar_url == nil}
  end

  def show
    if user_signed_in?
      @sources = current_user.all_follows.map {|subscription| Source.find(subscription.followable_id)}.reject { |source| source.last_post_at.nil? }.sort_by(&:last_post_at).reverse
      @sources = Kaminari.paginate_array(@sources).page(params[:page]).per(5)
      @source =  Source.where(twitter_id: params[:id])[0]

    else
      @sources = Source.all.order(last_post_at: :desc).reject { |source| source.last_post_at.nil? }
      @sources = Kaminari.paginate_array(@sources).page(params[:n]).per(5)
      @source =  Source.where(twitter_id: params[:id])[0]

    end
  end

  def follow
    source = Source.where(twitter_id: params[:id])[0]
    current_user.follow(source)
    render nothing: true
  end

  def stop_following
    source = Source.where(twitter_id: params[:id])[0]
    current_user.stop_following(source)
    render nothing: true
  end

  def suggestion
    message = "#{params[:suggestion]} - <https://twitter.com/#{params[:twitter_id]}|@#{params[:twitter_id]}>"
    Slack.new.post icon_emoji: ':pray:', username: 'New suggestion !', unfurl_links: true, text: message
  end

  private

  def source_params
    params.require(:source).permit(:twitter_id)
  end
end
