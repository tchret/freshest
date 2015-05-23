class AddContentToInfluencers < ActiveRecord::Migration
  def change
    add_column :influencers, :content, :text
  end
end
