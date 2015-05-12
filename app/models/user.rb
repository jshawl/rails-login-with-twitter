class User < ActiveRecord::Base
  def from_auth auth
    where(auth.slice("provider","uid").first)||create_from_omniauth(auth)
  end
  def self.create_from_omniauth(auth)
    User.create!(provider: auth["provider"], uid: auth["uid"], name: auth["info"]["nickname"])
  end
end
