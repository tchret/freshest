class AddCrispAverageToUser < ActiveRecord::Migration
  def change
    add_column :users, :crisp_average, :integer
  end
end
