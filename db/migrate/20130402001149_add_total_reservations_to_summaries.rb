class AddTotalReservationsToSummaries < ActiveRecord::Migration
  def change
    add_column :summaries, :total_reservation, :integer
  end
end
