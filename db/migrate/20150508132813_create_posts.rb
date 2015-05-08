class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.references :influencer, index: true

      t.timestamps null: false
    end
    add_foreign_key :posts, :influencers
  end
end
