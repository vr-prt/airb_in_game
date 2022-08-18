class AddCoordinatesToGameWorlds < ActiveRecord::Migration[7.0]
  def change
    add_column :game_worlds, :latitude, :float
    add_column :game_worlds, :longitude, :float
  end
end
