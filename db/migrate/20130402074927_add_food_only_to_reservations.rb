class AddFoodOnlyToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :food_only, :boolean, default: false
  end
end
