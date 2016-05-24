class SoundcloudUser
  def initialize(code)
    @code         = code
    @access_token = get_token
    get_user_info
  end

  def get_token
    client = Soundcloud.new(:client_id => ENV["soundcloud_client_id"],
                            :client_secret => ENV["soundcloud_client_secret"],
                            :redirect_uri => 'http://127.0.0.1:3000/auth/soundcloud/callback')

    client.exchange_token(code: @code)
  end

  def get_user_info
    "https://api.soundcloud.com/me?oauth_token=#{@access_token}"





    new_user.uid         = auth_info.uid
    new_user.username    = auth_info.username
    new_user.full_name   = auth_info.full_name
    new_user.oauth_token = auth_info.oauth_token
  end
end
