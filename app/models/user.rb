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

  after_create :follow_starting_pack, :slack_message

  acts_as_follower

  has_many :sources

  def self.find_for_twitter_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.followers_count = auth.extra.raw_info.followers_count
      user.name = auth.info.name
      user.twitter_id = auth.info.nickname
      user.picture = auth.info.image.gsub('normal', '400x400')
      user.token = auth.credentials.token
      user.secret = auth.credentials.secret
    end
  end

  def follow_starting_pack
    Source.select {|s| s.packs.include? Pack.find_by(slug: "start")}.each do |source|
      self.follow(source)
    end
  end

  def slack_message
    message = "<https://twitter.com/#{twitter_id}|@#{twitter_id}> (#{followers_count} followers) has joined the community!"
    Slack.new.post icon_emoji: ':raised_hands:', username: "New user", unfurl_links: true, text: message
  end

  def email_required?
    false
  end

  def first_name
    self.split(' ')[0]
  end

  def crisp_average
    avge = 0
    sum = 0
    all_follows.each do |follow|
      source = Source.find(follow.followable_id)
      if !source.last_post_at.nil?
        time = ((Time.now.to_i - Source.find(follow.followable_id).last_post_at.to_time.to_i) / 60)
        sum += time
      end
    end
    if all_follows.count == 0
      avge = 0
    elsif id == 201
      avge = 2880
    elsif sum / all_follows.count > 2880
      avge = 2880
    else
      avge = sum / all_follows.count
    end
    avge
  end
end
