class Pack < ActiveRecord::Base
  has_and_belongs_to_many :sources
  after_create :slugify

  def slugify
    self.slug = name.downcase.gsub(" ", "_")
    save
  end
end
