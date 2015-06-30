class RemoveSuggestedByFromSources < ActiveRecord::Migration
  def change
    remove_column :sources, :suggested_by, :string
  end
end
