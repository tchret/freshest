class SourcesController < ApplicationController
  def index
   @sources = Source.all.reject {|source| source.avatar_url == nil}
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

  private

  def source_params
    params.require(:source).permit(:twitter_id)
  end
end
