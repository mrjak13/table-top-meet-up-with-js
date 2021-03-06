class MeetUp < ApplicationRecord
	belongs_to :location
	belongs_to :meet_up_type
	belongs_to :game

	has_many :user_meet_ups
	has_many :users, through: :user_meet_ups

	# has_many :meet_up_games
	# has_many :games, through: meet_ups

	validates :name, :date, :time, presence: true

end
