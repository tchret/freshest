class RemoveOldCategoryFromSources < ActiveRecord::Migration
  def change
    remove_column :sources, :old_category, :string
  end
end
