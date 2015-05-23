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
