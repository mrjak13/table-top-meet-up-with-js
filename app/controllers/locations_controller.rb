class LocationsController < ApplicationController
	def index
		@locations = Location.all
	end

	def show
		@location = Location.find(params[:id])
	end

	def new
	end

	def create
		location = Location.create(location_params)
		if location.valid?
			redirect_to location_path(location)		
		else
			raise location.errors.full_messages.inspect
			redirect_to new_location_path
		end
	end

	def edit
		@location = Location.find(params[:id])
	end

	def update

	end

	def destroy
	end

	private

	def location_params
		params.require(:location).permit(
			:name,
			:address_1,
			:address_2,
			:city,
			:state,
			:zip
			)
	end
end
