class SummariesController < ApplicationController
  before_filter :collect_foods

  def today
    @summary = Summary.find_by_code(Time.zone.now.strftime('%d-%m-%Y'))
    unless @summary
      redirect_to reservations_path, notice: 'There is no reservation for today yet!'
      return
    end
    @reservations = Reservation.today.joins(:user).order('users.name').includes(:dishes, :backup_dishes)
  end

  private
  def collect_foods
    @foods = Food.order('name').select('name, id')
  end
end
