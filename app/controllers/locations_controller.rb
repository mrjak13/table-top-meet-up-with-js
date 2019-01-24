class LocationsController < ApplicationController
	before_action :must_be_logged_in, except: [:index]
	before_action :current_user, only: [:index]
	before_action :must_be_admin, except: [:index, :show]

	def index
		if params[:zip].present?
			@locations = Location.near_me(params[:zip])
			if @locations.empty?
				flash.now[:message] = "No locations with that zip"
				params.delete :zip
			end
		else
			@locations = Location.all
		end
	end

	def show
		@location = Location.find(params[:id])
	end

	def new
		@location= Location.new
	end

	def create		
		@location = Location.create(location_params)
		if @location.valid?
			redirect_to location_path(@location)		
		else
			render new_location_path
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
