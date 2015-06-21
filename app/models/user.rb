# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default("")
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime
#  updated_at             :datetime
#  provider               :string
#  uid                    :string
#  picture                :string
#  name                   :string
#  token                  :string
#  token_expiry           :datetime
#  secret                 :string
#  twitter_id             :string
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  devise :omniauthable, :omniauth_providers => [:twitter]

  after_create :follow_all

  acts_as_follower

  def self.find_for_twitter_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      raise
      user.email = auth.info.email
      user.followers_count = auth.extra.raw_info.followers_count
      user.name = auth.info.name
      user.twitter_id = auth.info.nickname
      user.picture = auth.info.image.gsub('normal', '400x400')
      user.token = auth.credentials.token
      user.secret = auth.credentials.secret
    end
  end

  def follow_all
    Influencer.all.each do |influencer|
      self.follow(influencer)
    end
  end

  def email_required?
    false
  end

  def first_name
    self.split(' ')[0]
  end
end
