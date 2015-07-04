class AddSlugToPacks < ActiveRecord::Migration
  def change
    add_column :packs, :slug, :string
    Pack.all do |pack|
      pack.slugify
    end
  end
end
