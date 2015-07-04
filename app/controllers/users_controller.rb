class UsersController < ApplicationController
  respond_to :json

  def is_follow
    source = Source.find(params[:source])
    @respond = user_signed_in? ? current_user.following?(source) : source.in_starting_pack?
    render :'users/is_follow'
  end
end
