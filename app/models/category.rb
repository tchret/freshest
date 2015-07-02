class Category < ActiveRecord::Base
  has_many :sources
end
