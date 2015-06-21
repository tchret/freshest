class RenameInfluencersToSources < ActiveRecord::Migration
  def change
    rename_table :influencers, :sources
  end
end

