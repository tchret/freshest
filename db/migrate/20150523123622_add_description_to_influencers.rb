class AddDescriptionToInfluencers < ActiveRecord::Migration
  def change
    add_column :influencers, :description, :text
  end
end
