class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by_email(params[:session][:email])
		if (user != nil) && (params[:session][:password] == user.password)
			sign_in(user)
			redirect_to tasks_path
		else
			redirect_to new_session_path
		end
	end

	def destroy
		cookies.delete(:user_id)
		redirect_to root_path
	end
end