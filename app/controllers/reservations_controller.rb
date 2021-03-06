class ReservationsController < ApplicationController
  before_filter :collect_foods, only: [:index, :new, :edit, :create, :update]
  before_filter :collect_users, only: [:new, :edit, :create, :update]
  before_filter :normalize_params, only: [:create]
  before_filter :preload_reservation, only: [:edit, :update]
  before_filter :find_reservation, only: [:backup_availability]

  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = Reservation.today.joins(:user).includes(:dishes, :backup_dishes).order('reservations.created_at')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reservations }
    end
  end

  # GET /reservations/new
  # GET /reservations/new.json
  def new
    @reservation = Reservation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reservation }
    end
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = Reservation.new(params[:reservation])

    respond_to do |format|
      if @reservation.save
        session[:last_user] = @reservation.user_id
        format.html { redirect_to reservations_path, notice: 'Reservation was successfully created.' }
        format.json { render json: @reservation, status: :created, location: @reservation }
      else
        format.html { render action: "new" }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reservations/1
  # PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update_attributes(params[:reservation])
        format.html { redirect_to reservations_path, notice: 'Reservation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy

    respond_to do |format|
      format.html { redirect_to reservations_url }
      format.json { head :no_content }
    end
  end

  def backup_availability
    respond_to do |format|
      if @reservation.update_column(:use_backup, params[:reservation][:use_backup])
        format.json { head :no_content }
      else
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def collect_foods
    @foods = Food.available.order('name').select('name, id')
  end

  def collect_users
    @users = User.not_reserved.order('name')
  end

  def preload_reservation
    find_reservation
    @users += [@reservation.user] if @users
  end

  def find_reservation
    @reservation = Reservation.find(params[:id])
  end

  def normalize_params
    params[:reservation][:comment] = params[:reservation][:comment][0..199] if params[:reservation][:comment].present?
  end
end
