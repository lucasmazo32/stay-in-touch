class FriendshipsController < ApplicationController
  def create
    current_uri = request.env['PATH_INFO']
    user = User.find(params[:user_id])
    create_logic(params[:friendship], user)
    redirect_to current_uri
  end
end
