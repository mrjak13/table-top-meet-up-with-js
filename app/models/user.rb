class User < ApplicationRecord
  has_secure_password

  has_many :user_games
  has_many :games, through: :user_games
  has_many :user_meet_ups
  has_many :meet_ups, through: :user_meet_ups
end
