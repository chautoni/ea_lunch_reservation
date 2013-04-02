class AddTotalFoodOnlyToSummaries < ActiveRecord::Migration
  def change
    add_column :summaries, :total_food_only, :integer
  end
end
