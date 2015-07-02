class RenameCategoryInSources < ActiveRecord::Migration
  def change
    rename_column :sources, :category, :old_category
    Source.all.each do |source|
      source.category = Category.find_or_create_by(name: source.old_category) unless source.old_category.nil?
      source.old_category = nil
      source.save
    end
  end
end
