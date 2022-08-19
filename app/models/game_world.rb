class GameWorld < ApplicationRecord
  belongs_to :user

  has_many :reservations, dependent: :destroy
  has_many_attached :photos

  geocoded_by :address

  validates :name, :description, :photos, presence: true

  after_validation :geocode, if: :will_save_change_to_address?

  validate :validate_images

  private

  def validate_images
    return if photos.count <= 3

    errors.add(:photos, 'You can upload max 3 images')
  end

end
