class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :game_worlds

  validates :email, :username, :password, presence: true
  validates :email, :username, uniqueness: true
  validates :username, :password, length: { in: 6..50 }
end
