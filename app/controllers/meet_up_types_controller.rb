class MeetUpTypesController < ApplicationController
	before_action :must_be_logged_in
	before_action :current_user, only: [:index, :show]
	before_action :must_be_admin, except: [:index, :show]
	before_action :assign_meet_up_type, only: [:show, :edit, :update, :destroy]

	def index
		@meet_up_types = MeetUpType.all
	end

	def show
	end

	def new
		@meet_up_type = MeetUpType.new
	end

	def create
		@meet_up_type = MeetUpType.create(meet_up_type_params)
		if @meet_up_type.valid?
			redirect_to meet_up_type_path(@meet_up_type)
		else
			render :new
		end
	end

	def edit
	end

	def update
		@meet_up_type.update(meet_up_type_params)
		if @meet_up_type.valid?
			redirect_to meet_up_type_path(@meet_up_type)
		else
			render :edit
		end
	end

	def destroy
		@meet_up_type.delete
		flash[:message] = "Meet up type deleted"
		redirect_to meet_up_types_path
	end

	private

	def meet_up_type_params
		params.require(:meet_up_type).permit(:name, :description)
	end

	def assign_meet_up_type
		@meet_up_type = MeetUpType.find(params[:id])
	end

end