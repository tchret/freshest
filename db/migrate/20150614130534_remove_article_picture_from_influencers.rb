class RemoveArticlePictureFromInfluencers < ActiveRecord::Migration
  def change
    remove_column :influencers, :article_picture
  end
end
