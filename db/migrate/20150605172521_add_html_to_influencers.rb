class AddHtmlToInfluencers < ActiveRecord::Migration
  def change
    add_column :influencers, :html, :string
  end
end
