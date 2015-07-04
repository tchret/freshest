class AddSlugToPacks < ActiveRecord::Migration
  def change
    add_column :packs, :slug, :string
  end
end
