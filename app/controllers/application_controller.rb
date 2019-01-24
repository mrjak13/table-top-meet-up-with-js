class ApplicationController < ActionController::Base

	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end

	def logged_in?
		!!current_user
	end

	def must_be_logged_in
        if !logged_in?
        	flash[:message] = "You must be logged in to access that."
        	redirect_to login_path
        end
    end

    def cant_be_logged_in
        if logged_in?
        	flash[:message] = "You're already logged in."
        	redirect_to user_path(current_user)
        end
    end

    def user_is_admin?
        current_user.admin
    end

    def must_be_admin
        if !user_is_admin?
            flash[:message] = "You don't have permission to do that"
            redirect_to user_path(current_user)
        end
    end

end
