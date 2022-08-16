class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :game_world
end
