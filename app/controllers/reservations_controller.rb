class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show edit update destroy owner_reservation]
  before_action :set_game_world, only: %i[new create]
  before_action :set_user, only: %i[index]

  def index
    @reservations = @user.reservations
  end

  def show
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)

    build_reservation

    @reservation.game_world = @game_world
    @reservation.user = current_user

    save_reservation(:new)
  end

  def edit
  end

  def update
    @reservation.update(reservation_params)

    if params[:reservation][:status].present?
      if @reservation.save
        redirect_to owner_reservation_path(@reservation)
      else
        render :owner_reservation, status: :unprocessable_entity
      end
    else
      save_reservation(:edit)
    end
  end

  def destroy
    @reservation.destroy
    redirect_to reservations_path, status: :see_other
  end

  def owner_reservations
    @reservations = Reservation.where(game_worlds: current_user.game_worlds)
  end

  def owner_reservation
    @statuses = { 'Confirm' => 'confirmed', 'Decline' => 'declined' }
  end

  private

  def set_user
    @user = current_user
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :status)
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def set_game_world
    @game_world = GameWorld.find(params[:game_world_id])
  end

  def build_reservation
    @reservation.start_date = params[:reservation][:start_date]
    @reservation.end_date = params[:reservation][:end_date]
  end

  def save_reservation(action_if_not_saved)
    if @reservation.save
      redirect_to reservation_path(@reservation)
    else
      render action_if_not_saved, status: :unprocessable_entity
    end
  end
end
