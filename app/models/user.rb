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
    avatar.gsub("large", "t500x500")
  end
end
