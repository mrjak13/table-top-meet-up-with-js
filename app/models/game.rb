class Game < ApplicationRecord

	has_many :user_games
	has_many :users, through: :user_games

	def players
		self.min_players.to_s + "-" + self.max_players.to_s 
	end
end
