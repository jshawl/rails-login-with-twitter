class User < ActiveRecord::Base
  def self.from_auth auth
    find_by(uid: auth.uid, provider: auth.provider)|| self.create_from_omniauth(auth)
  end
  def self.create_from_omniauth(auth)
    User.create!(provider: auth["provider"], uid: auth["uid"], name: auth["info"]["nickname"])
  end
end
