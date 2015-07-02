class CreateJoinTablePackSource < ActiveRecord::Migration
  def change
    create_join_table :packs, :sources do |t|
      t.index [:pack_id, :source_id]
      t.index [:source_id, :pack_id]
    end
    Source.all.each do |source|
      source.pack_id = nil
      source.save
    end
    remove_column :sources, :pack_id, :integer
  end
end
