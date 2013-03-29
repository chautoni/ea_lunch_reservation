class CreateReservationsBackupDishes < ActiveRecord::Migration
  def change
    create_table 'reservations_backup_dishes', id: false do |t|
      t.integer :reservation_id, null: false
      t.integer :backup_dish_id, null: false
    end

    add_index :reservations_backup_dishes, [:reservation_id, :backup_dish_id], name: 'by_backup_dishes'
  end
end
