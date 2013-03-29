class Reservation < ActiveRecord::Base
  belongs_to :user
  attr_accessible :user_id, :backup_dish_ids, :dish_ids

  has_and_belongs_to_many :backup_dishes, association_foreign_key: :backup_dish_id, join_table: 'reservations_backup_dishes', class_name: Food
  has_and_belongs_to_many :dishes, association_foreign_key: :dish_id, join_table: 'reservations_dishes', class_name: Food
  validates :user_id, presence: true
end
