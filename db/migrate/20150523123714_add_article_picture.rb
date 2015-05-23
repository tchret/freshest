class AddArticlePicture < ActiveRecord::Migration
  def change
    add_column :influencers, :article_picture, :string
  end
end
