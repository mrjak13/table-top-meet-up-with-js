class UserMeetUpsController < ApplicationController
  	def create
  		meet_up = MeetUp.find(params[:meet_up_id])
		current_user.add_meet_up(meet_up)		
		redirect_to user_path(@current_user)
	end

  	def update
  	end

  	def destroy
  	end
end
