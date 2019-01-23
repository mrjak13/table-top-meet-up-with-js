class UsersController < ApplicationController
	before_action :must_be_logged_in, except: [:new, :create]
	before_action :cant_be_logged_in, only: [:new, :create]

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		if @user.valid?
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			render new_user_path
		end
	end

	def edit

	end

	def update		

	end

	def destroy
	end

	private

	def user_params
		params.require(:users).permit(:name, :email, :password)
	end
end
