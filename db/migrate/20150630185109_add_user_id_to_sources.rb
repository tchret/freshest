class AddUserIdToSources < ActiveRecord::Migration
  def change
    add_column :sources, :user_id, :integer
  end
end
