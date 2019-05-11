class LocationsController < ApplicationController
	before_action :must_be_logged_in
	before_action :current_user, only: [:index]
	before_action :must_be_admin, except: [:index, :show]
	before_action :assign_location, only: [:show, :edit, :update, :destroy]

	def index
		if params[:zip].present?
			@locations = Location.near_me(params[:zip])
			if @locations.empty?
				flash.now[:message] = "No locations with that zip"
				params.delete :zip
			end
		else
			@locations = Location.all
			respond_to do |format|
				format.html {render :index}
				format.json {render json: @locations}
			end
		end
	end

	def show
		respond_to do |format|
			format.html {render :show}
			format.json {render json: @location}
		end
	end

	def new
		@location= Location.new
	end

	def create		
		@location = Location.create(location_params)
		if @location.valid?
			redirect_to location_path(@location)		
		else
			render :new
		end
	end

	def edit
	end

	def update
		@location.update(location_params)

		if @location.valid?
			redirect_to location_path(@location)
		else
			render :edit
		end
	end

	def destroy
		@location.delete
		flash[:message] = "Location deleted"
		redirect_to locations_path
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

	def assign_location
		@location = Location.find(params[:id])
	end

end
