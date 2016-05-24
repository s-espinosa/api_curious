class User < ActiveRecord::Base

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid         = auth_info.uid
      new_user.username    = auth_info.username
      new_user.full_name   = auth_info.full_name
      new_user.oauth_token = auth_info.oauth_token
    end
  end
end
