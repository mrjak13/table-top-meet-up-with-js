class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true

  has_many :user_games
  has_many :games, through: :user_games
  has_many :user_meet_ups
  has_many :meet_ups, through: :user_meet_ups

end
