class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :user

      t.timestamps
    end
    add_index :reservations, :user_id
  end
end
