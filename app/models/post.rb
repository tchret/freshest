class Post < ActiveRecord::Base
  belongs_to :influencer

  validates_presence_of :influencer, :content
end
