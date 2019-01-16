class MeetUpType < ApplicationRecord
	has_many :meet_ups
	has_many :locations, through: :meet_ups
end
