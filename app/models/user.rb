class User <OpenStruct
  def self.service
    SoundcloudService.new
  end

  def self.find(token)
    User.new(service.user_hash(token))
  end

  def service
    SoundcloudService.new
  end

  def followers(token)
    service.find_followers(self.id, token)
  end

  def following(token)
    service.find_following(self.id, token)
  end

  def bigger(avatar)
    big_avatar = avatar.gsub("large", "t500x500")
    if big_avatar == "http://a1.sndcdn.com/images/default_avatar_t500x500.png?1464260021"
      "/assets/generic_user.gif"
    else
      big_avatar
    end
  end
end
