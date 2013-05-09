class Reservation < ActiveRecord::Base
  belongs_to :user
  attr_accessible :user_id, :backup_dish_ids, :dish_ids, :comment, :food_only

  has_and_belongs_to_many :backup_dishes, association_foreign_key: :backup_dish_id, join_table: 'reservations_backup_dishes', class_name: Food
  has_and_belongs_to_many :dishes, association_foreign_key: :dish_id, join_table: 'reservations_dishes', class_name: Food
  validates :user_id, :dish_ids, presence: true
  validates_length_of :comment, maximum: 200, allow_blank: true
  validate :eligibility_to_reserve, on: :create

  before_save :set_price
  before_update :eligibility_to_update_reservation
  after_save :update_today_summary
  after_destroy :update_today_summary

  scope :food_only, where(food_only: true)

  BASIC_PRICE = 4000

  def self.today
    where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
  end

  private
  def set_price
    self.price = dishes.map(&:price).sum unless dish_ids.empty?
    self.price += BASIC_PRICE unless food_only?
  end

  def eligibility_to_reserve
    if Reservation.today.exists?(user_id: user_id)
      self.errors[:user_id] << 'You already reserved for today. Please come back by tomorrow!'
    end
  end

  def eligibility_to_update_reservation
    eligibility_to_reserve if user_id_changed?
  end

  def update_today_summary
    Summary.update_today_summary
  end
end
