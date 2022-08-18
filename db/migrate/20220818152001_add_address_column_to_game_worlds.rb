class AddAddressColumnToGameWorlds < ActiveRecord::Migration[7.0]
  def change
    add_column :game_worlds, :address, :string
  end
end
