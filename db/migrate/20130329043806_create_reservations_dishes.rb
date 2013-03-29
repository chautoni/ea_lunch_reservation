class CreateReservationsDishes < ActiveRecord::Migration
  def up
    create_table 'reservations_dishes', id: false do |t|
      t.integer :reservation_id, null: false
      t.integer :dish_id, null: false
    end

    add_index :reservations_dishes, [:reservation_id, :dish_id], name: 'by_dishes'
  end
end
