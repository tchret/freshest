class AddCategoryIdToSources < ActiveRecord::Migration
  def change
    add_column :sources, :category_id, :integer
  end
end
