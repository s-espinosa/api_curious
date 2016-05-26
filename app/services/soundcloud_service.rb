class SoundcloudService

  def client
    @client = Soundcloud.new(:client_id => ENV["soundcloud_client_id"],
                            :client_secret => ENV["soundcloud_client_secret"],
                            :redirect_uri => 'http://127.0.0.1:3000/auth/soundcloud/callback')
  end

  def user_hash(token)
    parse(get_user(token))
  end

  def get_token(code)
    client.exchange_token(code: code)["access_token"]
  end

  def find_followers(id, token)
    parse(get_followers(id, token))
  end

  def find_following(id, token)
    parse(get_following(id, token))
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_user(token)
    connection.get("/me?oauth_token=#{token}")
  end

  def get_followers(id, token)
    connection.get("/users/#{id}/followers?oauth_token=#{token}")
  end

  def get_following(id, token)
    connection.get("/users/#{id}/followings?oauth_token=#{token}")
  end

  def connection
    Faraday.new(:url => 'https://api.soundcloud.com') do |faraday|
      faraday.request  :url_encoded
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end
  end
end
