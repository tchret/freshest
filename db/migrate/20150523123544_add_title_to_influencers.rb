class AddTitleToInfluencers < ActiveRecord::Migration
  def change
    add_column :influencers, :title, :string
  end
end
