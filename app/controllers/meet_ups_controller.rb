class MeetUpsController < ApplicationController
	before_action :must_be_logged_in
	before_action :create_date_time, only: [:create, :update]
	before_action :must_be_admin, except:[:index, :show]
	before_action :assign_meet_up, only: [:show, :edit, :update, :destroy]
	before_action :assign_games_and_types, only: [:new, :create, :edit, :update]

	
	def index
		@meet_ups = MeetUp.all
	end

	def show
		current_user
		@user_meet_up = UserMeetUp.find_by(user_id: @current_user, meet_up_id: @meet_up)
	end

	def new
		@meet_up = MeetUp.new		
		if params[:location_id].present?		
			@location = Location.find(params[:location_id])	
		else
			flash[:message] = "You can't do that"
			redirect_to user_path(current_user)
		end	
	end

	def create		
		@location = Location.find(params[:location_id])	
		@meet_up = MeetUp.new(meet_up_params)
		@meet_up.update(date: @date_time, time: @date_time, location_id: @location.id)		
		if @meet_up.valid?			
			redirect_to meet_up_path(@meet_up)
		else
			render :new
		end
	end

	def edit
	end

	def update
		@meet_up.update(meet_up_params)
		@meet_up.update(date: @date_time, time: @date_time)
		if @meet_up.valid?
			redirect_to meet_up_path(@meet_up)
		else
			render :edit
		end
	end

	def destroy
		@meet_up.delete
		flash[:message] = "Meet up deleted"
		redirect_to meet_ups_path
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

	def assign_meet_up
		@meet_up = MeetUp.find(params[:id])
	end

	def assign_games_and_types
		@games = Game.all
		@meet_up_types = MeetUpType.all	
	end
end
