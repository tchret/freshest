class RenameCategoryIdInSources < ActiveRecord::Migration
  def change
    rename_column :sources, :category_id, :pack_id
  end
end
