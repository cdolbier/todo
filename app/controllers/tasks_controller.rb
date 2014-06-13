class TasksController < ApplicationController
	before_filter :authenticate

	def index
		@tasks = current_user.tasks
	end

	def new
		@task = current_user.tasks.new
	end

	def create
		@task = current_user.tasks.create(params[:task].permit(:todo))
		@task.user_id = current_user.id
		@task.save
		redirect_to tasks_path
	end

	def edit
		@task = current_user.tasks.find(params[:id])
	end

	def update
		@task = current_user.tasks.find(params[:id])
		@task.update_attributes(params[:task].permit(:todo))
		redirect_to tasks_path
	end

	def destroy
		@task = current_user.tasks.find(params[:id])
		@task.destroy
		redirect_to tasks_path
	end
end