class CreateInfluencers < ActiveRecord::Migration
  def change
    create_table :influencers do |t|
      t.string :name
      t.string :twitter_id

      t.timestamps null: false
    end
  end
end
