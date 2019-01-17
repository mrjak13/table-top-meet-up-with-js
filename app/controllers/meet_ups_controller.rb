class MeetUpsController < ApplicationController
	def index
		@meet_ups = MeetUp.all
	end

	def show
		current_user
		@meet_up = MeetUp.find(params[:id])
	end

	def new
	end

	def create
	end

	def edit
		@meet_up = MeetUp.find(params[:id])
	end

	def update
	end

	def destroy
	end
end
