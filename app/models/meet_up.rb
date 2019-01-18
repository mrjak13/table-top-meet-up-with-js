class MeetUp < ApplicationRecord
	belongs_to :location
	belongs_to :meet_up_type

	has_many :user_meet_ups
	has_many :users, through: :user_meet_ups

	# has_many :meet_up_games
	# has_many :games, through: meet_ups
end
