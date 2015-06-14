class RemoveContentFromInfluencers < ActiveRecord::Migration
  def change
    remove_column :influencers, :content
  end
end
