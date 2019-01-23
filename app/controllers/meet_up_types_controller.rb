class MeetUpTypesController < ApplicationController
	before_action :must_be_logged_in, except: [:index]
	def index
		@meet_up_types = MeetUpType.all
	end

	def show
		@meet_up_type = MeetUpType.find(params[:id])
	end

	def new
		@meet_up_type = MeetUpType.new
	end

	def create
		@meet_up_type = MeetUpType.create(meet_up_type_params)
		if @meet_up_type.valid?
			redirect_to meet_up_type_path(@meet_up_type)
		else
			render new_meet_up_type_path
		end
	end

	def edit
		@meet_up_type = MeetUpType.find(params[:id])
	end

	def update
	end

	def destroy
	end

	private

	def meet_up_type_params
		params.require(:meet_up_type).permit(:name, :description)
	end
end