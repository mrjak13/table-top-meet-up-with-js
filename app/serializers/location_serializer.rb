class LocationSerializer < ActiveModel::Serializer
  attributes :id, :name, :address_1, :address_2, :city, :state, :zip
  has_many :meet_ups
end
