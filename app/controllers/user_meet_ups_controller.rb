class UserMeetUpsController < ApplicationController
  	def create
  		meet_up = MeetUp.find(params[:meet_up_id])
		current_user.add_meet_up(meet_up)		
		redirect_to meet_up_path(meet_up)
	end

  	def destroy
  		@user_meet_up = UserMeetUp.find(params[:id])
  		@user_meet_up.destroy
  		
  		redirect_to meet_up_path(@user_meet_up.meet_up)
  	end
end
