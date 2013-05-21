class Summary < ActiveRecord::Base
  attr_accessible :code, :content
  belongs_to :caller, class_name: User.name

  validates :code, :content, presence: true
  validates :code, uniqueness: true

  def self.today
    find_by_code(Time.zone.now.strftime('%d-%m-%Y'))
  end

  def self.update_today_summary
    summary = Summary.find_or_create_by_code(Time.zone.now.strftime('%d-%m-%Y'))
    summary_data = Reservation.today.joins(:dishes).select('foods.name, count(foods.name)').group('foods.name')
    summary.content = ActionView::Base.new(
      Rails.configuration.paths["app/views"]).render(
      :partial => 'summaries/table', :format => :txt,
      :locals => { :summaries => summary_data }
    )
    summary.total_price = Reservation.today.sum(:price)
    summary.total_reservation = Reservation.today.count
    summary.total_food_only = Reservation.today.food_only.count
    summary.total_foods = Reservation.today.joins(:dishes).select('count(foods.id)').first.count
    summary.save
  end

  def self.draw_caller
    summary = Summary.today
    if summary && !summary.caller.present?
      summary.caller = User.order('random()').where(id: Reservation.today.pluck(:user_id)).where('name <> ?', 'Thach Chau').first
      summary.save
    end
  end
end
