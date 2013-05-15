class AddUseBackupToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :use_backup, :boolean, default: false
  end
end
