class GameWorld < ApplicationRecord
  belongs_to :user

  has_many :reservations, dependent: :destroy
  has_many_attached :photos

  geocoded_by :address

  validates :name, :description, :photos, presence: true

  after_validation :geocode, if: :will_save_change_to_address?
end
