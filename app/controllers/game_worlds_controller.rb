class GameWorldsController < ApplicationController
  def index
  end

  def new
    @game_world = GameWorld.new
  end

  def create
    @user = current_user
    @game_world = GameWorld.new(game_world_params)
    @game_world.user = @user
  end

  private

  def game_world_params
    params.require(:game_world).permit(:name, :description)
  end
end
