class MeetUpType < ApplicationRecord
	has_many :meet_ups
	has_many :locations, through: :meet_ups

	validates :name, uniqueness: true
	validates :name, :description, presence: true
end
