class MeetUpType < ApplicationRecord
	has_many :meet_ups
	has_many :locations, through: :meet_ups

	validates :name, uniqueness: true
	validates :name, :description, presence: true

	# add method to show what game is most popular in each type?
	# add method to show what location is most popular in each type?
end
