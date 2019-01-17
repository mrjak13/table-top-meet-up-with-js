class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def new
	end

	def create
		@user = User.create(user_params)

		if @user.valid?
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			raise @user.errors.full_messages.inspect
			redirect_to signup_path
		end
	end

	def edit

	end

	def update		
		meet_up = MeetUp.find(params[:meet_up_id])
		current_user.add_meet_up(meet_up)		
		redirect_to user_path(@current_user)
	end

	def destroy
	end

	private

	def user_params
		params.require(:users).permit(:name, :email, :password)
	end
end
