class AddAvailableToFoods < ActiveRecord::Migration
  def change
    add_column :foods, :available, :boolean, default: false
  end
end
