class SessionsController < ApplicationController
  def new
    client = SoundcloudService.new.client
    redirect_to client.authorize_url()
  end

  def create
    session[:token] = SoundcloudService.new.get_token(params[:code])
    redirect_to user_path(0)
  end

  def delete
    session.clear
    redirect_to root_path
  end
end
