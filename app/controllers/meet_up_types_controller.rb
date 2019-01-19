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
		type = MeetUpType.create(meet_up_type_params)
		if type.valid?
			redirect_to meet_up_type_path(type)
		else
			redirect_to new_meet_up_type_path
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