class UpdateLastPostTimeAgoInInfluencer < ActiveRecord::Migration
  def change
    rename_column :influencers, :last_post_time_ago, :last_post_at
  end
end
