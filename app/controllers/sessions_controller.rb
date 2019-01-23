class SessionsController < ApplicationController
  before_action :must_be_logged_in, only: [:destroy]
  before_action :cant_be_logged_in, only: [:new, :create]

  def new
  end

  def create 
     
  	if auth
      user = User.find_or_create_by(email: auth[:info][:email]) do |u|
        u.name = auth[:info][:first_name]
        u.email = auth[:info][:email]
        u.password = Digest::SHA256.hexdigest('a secret key')
      end      
      session[:user_id] = user.id
      redirect_to user_path(user)
  	elsif params[:email] != "" && params[:password] != ""
  		user = User.find_by(email: params[:email])
  		if user && user.authenticate(params[:password])
  			session[:user_id] = user.id
  			redirect_to user_path(user)
  		else
  			flash[:message] = "Incorrect email or password"
  			redirect_to login_path
  		end
  	else
  		flash[:message] = "Email and password required"
  		redirect_to login_path
  	end
  end

  def destroy  	
  	session.delete :user_id
  	redirect_to login_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
