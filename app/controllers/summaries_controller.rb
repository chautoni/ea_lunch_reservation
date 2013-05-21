class SummariesController < ApplicationController
  before_filter :find_summary, :collect_foods, only: [:today]

  def today
    @reservations = Reservation.today.joins(:user).order('users.name').includes(:dishes, :backup_dishes)
  end

  def query
    Summary.draw_caller if Time.zone.now > Reservation.deadline
    redirect_to today_summaries_path
  end

  private
  def collect_foods
    @foods = Food.order('name').select('name, id')
  end

  def find_summary
     @summary = Summary.find_by_code(Time.zone.now.strftime('%d-%m-%Y'))
    unless @summary
      redirect_to reservations_path, notice: 'There is no reservation for today yet!'
      return
    end
  end
end
