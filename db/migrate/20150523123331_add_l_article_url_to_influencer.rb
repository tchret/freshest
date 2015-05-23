class AddLArticleUrlToInfluencer < ActiveRecord::Migration
  def change
    add_column :influencers, :article_url, :string
  end
end
