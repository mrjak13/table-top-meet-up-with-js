class MeetUpTypesController < ApplicationController
	def index
		@meet_up_types = MeetUpType.all
	end

	def show
		@meet_up_type = MeetUpType.find(params[:id])
	end

	def new
	end

	def create
	end

	def edit
		@meet_up_type = MeetUpType.find(params[:id])
	end

	def update
	end

	def destroy
	end
end