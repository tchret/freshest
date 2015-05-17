class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  devise :omniauthable, :omniauth_providers => [:twitter]

  def self.find_for_twitter_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.name = auth.info.name
      user.twitter_id = auth.info.nickname
      user.picture = auth.info.image.gsub('normal', '400x400')
      raise
      user.token = auth.credentials.token
      user.secret = auth.credentials.secret
    end
  end

  def email_required?
    false
  end
end
