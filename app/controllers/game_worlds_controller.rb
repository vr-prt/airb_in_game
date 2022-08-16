class GameWorldsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @game_worlds = GameWorld.all
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
    params.require(:game_world).permit(:name, :description)
  end
end
