class GameWorldsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    if params[:search]
      game_params = params[:search][:name].downcase
      @game_worlds = GameWorld.where("LOWER(name) LIKE ?", "%#{game_params}%")
    else
      @game_worlds = GameWorld.all
    end
  end

  def new
    @game_world = GameWorld.new
  end

  def show
    @game_world = GameWorld.find(params[:id])
  end

  def create
    @user = current_user
    @game_world = GameWorld.new(game_world_params)
    @game_world.user = @user
    if @game_world.save
      redirect_to game_world_path(@game_world)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def game_world_params
    params.require(:game_world).permit(:name, :description, :photo)
  end
end
