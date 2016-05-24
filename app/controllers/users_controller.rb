class UsersController < ApplicationController
  def new

  end

  def show
    @user = User.find(params[:id])
    conn = Faraday.new(:url => 'https://api.soundcloud.com') do |faraday|
      faraday.request  :url_encoded
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end

    response = conn.get("/me?oauth_token=#{@user.oauth_token}")
    @soundcloud_info = JSON.parse(response.body)
    @followings = JSON.parse(conn.get("/users/#{@user.uid}/followings?client_id=#{ENV['soundcloud_client_id']}").body)["collection"]
    @followers  = JSON.parse(conn.get("/users/#{@user.uid}/followers?client_id=#{ENV['soundcloud_client_id']}").body)["collection"]
  end
end
