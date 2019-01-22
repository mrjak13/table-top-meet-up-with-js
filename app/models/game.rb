class Game < ApplicationRecord
	has_many :meet_ups

	has_many :user_games
	has_many :users, through: :user_games

	validates :name, :min_players, :max_players, :description, :play_time, presence: true
	validates :name, uniqueness: true
	validates :min_players, :max_players, numericality: { only_integer: true }


	def players
		self.min_players.to_s + "-" + self.max_players.to_s 
	end
end
