class User < ActiveRecord::Base
  attr_accessible :name
  has_many :reservations

  def self.not_reserved
    where('id not in (?)', Reservation.today.pluck(:user_id) + [0])
  end
end
