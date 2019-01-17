class Location < ApplicationRecord
	has_many :meet_ups
	has_many :meet_up_types, through: :meet_ups

	scope :near_me, -> (zip) { where("zip = ?", zip) }
end
