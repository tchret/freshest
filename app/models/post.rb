# == Schema Information
#
# Table name: posts
#
#  id            :integer          not null, primary key
#  content       :text
#  influencer_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  image_url     :string
#

class Post < ActiveRecord::Base
  belongs_to :influencer

  validates_presence_of :influencer, :content
end
