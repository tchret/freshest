class RemoveHtmlFromInfluencers < ActiveRecord::Migration
  def change
    remove_column :influencers, :html
  end
end
