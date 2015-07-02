# == Schema Information
#
# Table name: sources
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

class Source < ActiveRecord::Base
  has_many :posts
  belongs_to :user
  has_and_belongs_to_many :packs
  # after_create :add_user_to_list
  acts_as_followable

  validates_presence_of :name, :twitter_id
  validates_uniqueness_of :twitter_id

  def to_param
    twitter_id
  end

  def self.update_last_post_at_in_minutes
    all.each do |source|
      source.last_post_at_in_minutes = (Time.now.to_i - source.last_post_at.to_i) / 60
      source.save
    end
  end

  def self.update_avatars
    Source.all.each do |source|
      if source.avatar_url
        source.avatar_url = source.avatar_url.gsub('normal', '400x400')
      end
      source.save
    end
  end

  def self.update_link
    Source.all.each do |source|
      if source.article_url
        open(source.article_url) do |resp|
          puts resp.base_uri.to_s
          source.article_url = resp.base_uri.to_s
          source.save
        end

      end
    end
  end

  def self.update_iframeable
    Source.all.each do |source|
      if source.article_url
        source.iframeable = open(source.article_url) {|f| !f.meta.has_key?("x-frame-options") }
        puts  source.iframeable
        source.save
      end
    end
  end

  # def add_user_to_list
  #   TwitterService.new.add_source_to_list('freshst-dev', self.twitter_id)
  # end

end
