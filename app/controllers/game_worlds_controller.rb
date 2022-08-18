class GameWorldsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  before_action :set_game_world, only: %i[show edit update destroy]
  before_action :set_user, only: %i[show create my_game_worlds]

  def index
    if params[:search].present?
      @game_worlds = GameWorld.where("name ILIKE ? OR description ILIKE ?", "%#{params[:search][:name]}%", "%#{params[:search][:name]}%")
    else
      @game_worlds = GameWorld.all
    end

    @markers = @game_worlds.geocoded.map do |game_world|
      {
        lat: game_world.latitude,
        lng: game_world.longitude,
        info_window: render_to_string(partial: "info_window", locals: {game_world: game_world})
      }
    end
  end

  def new
    @game_world = GameWorld.new
  end

  def show
  end

  def create
    @game_world = GameWorld.new(game_world_params)
    @game_world.user = @user

    save_and_redirect(:new)
  end

  def edit
  end

  def update
    @game_world.update(game_world_params)

    save_and_redirect(:edit)
  end

  def destroy
    @game_world.destroy

    redirect_to my_game_worlds_path, status: :see_other
  end

  def my_game_worlds
    @game_worlds = @user.game_worlds
  end

  private

  def set_game_world
    @game_world = GameWorld.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def game_world_params
    params.require(:game_world).permit(:name, :description, :photo)
  end

  def save_and_redirect(action)
    if @game_world.save
      redirect_to game_world_path(@game_world)
    else
      render action, status: :unprocessable_entity
    end
  end
end
