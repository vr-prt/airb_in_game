class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show edit update]
  before_action :set_game_world, only: %i[new create]

  def index
    @reservations = Reservation.all
  end

  def show
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    build_reservation_date
    @reservation.game_world = @game_world
    @reservation.user = current_user

    save_reservation(:new)
  end

  def edit
  end

  def update
    build_reservation_date
    save_reservation(:edit)
  end

  def destroy
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def set_game_world
    @game_world = GameWorld.find(params[:game_world_id])
  end

  def build_reservation_date
    @reservation.start_date = params[:reservation][:start_date]
    @reservation.end_date = params[:reservation][:end_date]
  end

  def save_reservation(action)
    if @reservation.save
      redirect_to reservation_path(@reservation)
    else
      render action, status: :unprocessable_entity
    end
  end
end
