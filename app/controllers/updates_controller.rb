class UpdatesController < ApplicationController
  def show
    Fetcher.update_food_data
    redirect_to reservations_path, notice: 'Updating completed!'
  end
end
