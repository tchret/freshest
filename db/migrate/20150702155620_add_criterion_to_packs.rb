class AddCriterionToPacks < ActiveRecord::Migration
  def change
    add_column :packs, :criterion, :string
  end
end
