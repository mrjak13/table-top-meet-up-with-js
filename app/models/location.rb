class Location < ApplicationRecord
	has_many :meet_ups
	has_many :meet_up_types, through: :meet_ups

	validates :name, :address_1, :city, :state, :zip, presence: true
	validates :name, uniqueness: true
	validates :zip, length: { is: 5 }



	scope :near_me, -> (zip) { where("zip = ?", zip) }

	def address
		"#{self.address_1} " +
		"#{self.city}, " +
		"#{self.state}, " +
		"#{self.zip}" + "  " +
		"#{self.address_2}"
	end
end
