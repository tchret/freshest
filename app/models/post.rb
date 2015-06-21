# == Schema Information
#
# Table name: posts
#
#  id            :integer          not null, primary key
#  content       :text
#  source_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  image_url     :string
#

class Post < ActiveRecord::Base
  belongs_to :source

  validates_presence_of :source, :content
end
