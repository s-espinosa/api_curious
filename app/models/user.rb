class User < ActiveRecord::Base

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.id            = auth_info[:id]
      new_user.username      = auth_info[:username]
      new_user.full_name     = auth_info[:full_name]
      new_user.oauth_token   = auth_info[:oauth_token]
      new_user.refresh_token = auth_info[:refresh_token]
    end
  end
end
