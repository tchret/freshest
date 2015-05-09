class Influencer < ActiveRecord::Base
  has_many :posts

  validates_presence_of :name, :twitter_id
  validates_uniqueness_of :twitter_id

  def to_param
    twitter_id
  end

end
