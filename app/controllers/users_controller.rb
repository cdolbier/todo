class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.create(params[:user].permit(:email, :password))
		if((@user.email.include? "@") && (@user.password != ""))
			@user.save
			sign_in @user
			redirect_to "/tasks"
		else
			redirect_to new_user_path
		end
	end

	def edit
		@user = current_user
	end

	def update
		@user = current_user
		if((params[:user][:email].include? "@") && (params[:user][:password] != "") && (params[:user][:password] != nil))
			@user.update_attributes(params[:user].permit(:email, :password))
			redirect_to "/tasks"
		else
			redirect_to "/users/#{current_user.id}/edit"
		end
	end
end