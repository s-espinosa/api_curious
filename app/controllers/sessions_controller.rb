class SessionsController < ApplicationController
  def new
    client = Soundcloud.new(:client_id => ENV["soundcloud_client_id"],
                            :client_secret => ENV["soundcloud_client_secret"],
                            :redirect_uri => 'http://127.0.0.1:3000/auth/soundcloud/callback')

    redirect_to client.authorize_url()
  end

  def create
    soundcloud_user = SoundcloudUser.new(params[:code])
    user_info = soundcloud_user.get_user_info

    if user = User.from_omniauth(user_info)
      session[:user_id] = user.id
    end
    redirect_to user_path(user.id)
  end
end
