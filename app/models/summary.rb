class Summary < ActiveRecord::Base
  attr_accessible :code, :content

  validates :code, :content, presence: true
  validates :code, uniqueness: true

  def self.update_today_summary
    summary = Summary.find_or_create_by_code(Time.zone.now.strftime('%d-%m-%Y'))
    summary_data = Reservation.today.joins(:dishes).select('foods.name, count(foods.name)').group('foods.name')
    summary.content = ActionView::Base.new(
        Rails.configuration.paths["app/views"]).render(
        :partial => 'summaries/table', :format => :txt,
        :locals => { :summaries => summary_data })
    summary.total_price = Reservation.today.sum(:price)
    summary.total_reservation = Reservation.today.count
    summary.total_food_only = Reservation.today.food_only.count
    summary.save
  end
end
