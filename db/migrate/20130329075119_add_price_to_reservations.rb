class AddPriceToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :price, :integer
  end
end
