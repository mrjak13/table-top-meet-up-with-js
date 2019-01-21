class MeetUpsController < ApplicationController
	def index
		@meet_ups = MeetUp.all
	end

	def show
		current_user
		@meet_up = MeetUp.find(params[:id])
	end

	def new		
		if params[:location_id].present?		
			@games = Game.all
			@meet_up_types = MeetUpType.all		
			@location = Location.find(params[:location_id])	
		else
			redirect_to user_path(current_user)
		end	
	end

	def create		
		create_date_time
		location = Location.find(params[:location_id])
		meet_up = MeetUp.new(meet_up_params)
		meet_up.update(date: @date_time, time: @date_time, location_id: location.id)		
		if meet_up.valid?			
			redirect_to meet_up_path(meet_up)
		else
			redirect_to location_path(location)
		end
	end

	def edit
		@meet_up = MeetUp.find(params[:id])
	end

	def update
	end

	def destroy
	end

	private

	def meet_up_params
		params.require(:meet_up).permit(
			:name,
			:meet_up_type_id,
			:location_id, 
			:game_id
			)
	end

	def create_date_time
		year = params[:meet_up]["date(1i)"].to_i
		month = params[:meet_up]["date(2i)"].to_i
		day = params[:meet_up]["date(3i)"].to_i
		hour = params[:meet_up]["time(4i)"].to_i
		minute = params[:meet_up]["time(5i)"].to_i

		@date_time = DateTime.new(year, month, day, hour, minute)
	end
end
