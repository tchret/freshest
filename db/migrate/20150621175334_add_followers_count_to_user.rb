class AddFollowersCountToUser < ActiveRecord::Migration
  def change
    add_column :users, :followers_count, :integer
  end
end
