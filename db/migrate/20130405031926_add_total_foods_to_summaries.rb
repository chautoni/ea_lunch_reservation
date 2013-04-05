class AddTotalFoodsToSummaries < ActiveRecord::Migration
  def change
    add_column :summaries, :total_foods, :integer
  end
end
