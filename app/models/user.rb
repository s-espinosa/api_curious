class User <OpenStruct
  def self.service
    SoundcloudService.new
  end

  def self.find(token)
    User.new(service.user_hash(token))
  end
end
