class AddTotalPriceToSummaries < ActiveRecord::Migration
  def change
    add_column :summaries, :total_price, :integer
  end
end
