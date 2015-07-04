class UsersController < ApplicationController
  respond_to :json

  def is_follow
    source = Source.find(params[:source])
    @respond = user_signed_in? ? current_user.following?(source) : source.user.twitter_id == "frshst"
    render :'users/is_follow'
  end
end
