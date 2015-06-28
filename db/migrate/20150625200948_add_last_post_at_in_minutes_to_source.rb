class AddLastPostAtInMinutesToSource < ActiveRecord::Migration
  def change
    add_column :sources, :last_post_at_in_minutes, :integer
  end
end
