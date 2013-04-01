class Summary < ActiveRecord::Base
  attr_accessible :code, :content

  validates :code, :content, presence: true
  validates :code, uniqueness: true

  def self.update_today_summary
    summary = Summary.find_or_create_by_code(Time.zone.now.strftime('%d-%m-%Y'))
    summary.content = Reservation
    .today
    .joins(:dishes)
    .select('foods.name, count(foods.name)')
    .group('foods.name').map do |reservation|
      "#{reservation.name}:#{reservation.count}"
    end.join('|')
    summary.total_price = Reservation.today.sum(:price)
    summary.save
  end
end
