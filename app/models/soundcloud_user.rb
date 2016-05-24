class SoundcloudUser
  def initialize(code)
    @code         = code
    @access_token = get_token
  end

  def get_token
    client = Soundcloud.new(:client_id => ENV["soundcloud_client_id"],
                            :client_secret => ENV["soundcloud_client_secret"],
                            :redirect_uri => 'http://127.0.0.1:3000/auth/soundcloud/callback')

    client.exchange_token(code: @code)
  end

  def get_user_info
    conn = Faraday.new(:url => 'https://api.soundcloud.com') do |faraday|
      faraday.request  :url_encoded
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end

    response = conn.get("/me?oauth_token=#{@access_token.access_token}")
    auth_info = JSON.parse(response.body)

    new_user = {}
    new_user[:uid]           = auth_info["id"]
    new_user[:username]      = auth_info["username"]
    new_user[:full_name]     = auth_info["full_name"]
    new_user[:oauth_token]   = @access_token.access_token
    new_user[:refresh_token] = @access_token.refresh_token
    new_user
  end
end
