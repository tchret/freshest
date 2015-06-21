# == Schema Information
#
# Table name: influencers
#
#  id              :integer          not null, primary key
#  name            :string
#  twitter_id      :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  avatar_url      :string
#  article_url     :string
#  title           :string
#  description     :text
#  article_picture :string
#  content         :text
#  last_post_at    :string
#

class Influencer < ActiveRecord::Base
  has_many :posts
  # after_create :add_user_to_list
  acts_as_followable

  validates_presence_of :name, :twitter_id
  validates_uniqueness_of :twitter_id

  def to_param
    twitter_id
  end

  def self.update_avatars
    Influencer.all.each do |influencer|
      if influencer.avatar_url
        influencer.avatar_url = influencer.avatar_url.gsub('normal', '400x400')
      end
      influencer.save
    end
  end

  def self.update_link
    Influencer.all.each do |influencer|
      if influencer.article_url
        open(influencer.article_url) do |resp|
          puts resp.base_uri.to_s
          influencer.article_url = resp.base_uri.to_s
          influencer.save
        end

      end
    end
  end

  def self.update_iframeable
    Influencer.all.each do |influencer|
      if influencer.article_url
        influencer.iframeable = open(influencer.article_url) {|f| !f.meta.has_key?("x-frame-options") }
        puts  influencer.iframeable
        influencer.save
      end
    end
  end

  # def add_user_to_list
  #   TwitterService.new.add_influencer_to_list('freshst-dev', self.twitter_id)
  # end

end
