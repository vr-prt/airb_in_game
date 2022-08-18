class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :game_world

  validates :start_date, :end_date, presence: true
  # validates :start_date, comparison: { greater_than: Date.today }
  validates :end_date, comparison: { greater_than: :start_date }

  enum status: {
    pending: 0,
    confirmed: 1,
    done: 2
  }
end
