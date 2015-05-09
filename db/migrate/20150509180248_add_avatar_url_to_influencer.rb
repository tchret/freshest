class AddAvatarUrlToInfluencer < ActiveRecord::Migration
  def change
    add_column :influencers, :avatar_url, :string
  end
end
