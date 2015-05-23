class AddLastPostAtToInfluencers < ActiveRecord::Migration
  def change
    add_column :influencers, :last_post_time_ago, :string
  end
end
