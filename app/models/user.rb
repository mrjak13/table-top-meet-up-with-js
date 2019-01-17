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

  def add_game(game_name)
  	game = Game.find_by(name: game_name)
  	if self.games.include?(game)
  		"#{game_name} is already in your library"
  	else
  		self.games << game
  	end
  end

  def add_meet_up(meet_up)
    # meet_up = MeetUp.find_by(name: meet_up_name)
    if self.meet_ups.include?(meet_up)
      "You are already attending #{meet_up.name}."
    else
      self.meet_ups << meet_up
    end
  end

end
