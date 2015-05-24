class ChangeLastPostAtInInfluencers < ActiveRecord::Migration
  def change
    change_column :influencers, :last_post_at, 'timestamp using CAST(last_post_at AS timestamp)'
  end
end
