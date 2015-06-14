class RemoveContentClassFromInfluencers < ActiveRecord::Migration
  def change
    remove_column :influencers, :content_class
  end
end
