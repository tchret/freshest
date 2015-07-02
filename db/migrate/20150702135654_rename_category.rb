class RenameCategory < ActiveRecord::Migration
  def change
    rename_table :categories, :packs
  end
end
