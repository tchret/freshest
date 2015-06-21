class AddIframeableToInfluencer < ActiveRecord::Migration
  def change
    add_column :influencers, :iframeable, :boolean
  end
end
