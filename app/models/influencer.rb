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

  validates_presence_of :name, :twitter_id
  validates_uniqueness_of :twitter_id

  def to_param
    twitter_id
  end

  def update_avatars
    Influencer.all.each do |influencer|

    end
  end

  # def add_user_to_list
  #   TwitterService.new.add_influencer_to_list('freshst-dev', self.twitter_id)
  # end

end
