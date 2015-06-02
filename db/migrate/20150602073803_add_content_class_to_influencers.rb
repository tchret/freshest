class AddContentClassToInfluencers < ActiveRecord::Migration
  def change
    add_column :influencers, :content_class, :string
  end
end
