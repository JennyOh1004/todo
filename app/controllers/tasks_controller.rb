class TasksController < ApplicationController
	before_action :set_task, only: [:show]

	def index 
	  @tasks = Task.all
	  render json: Task.order(:id)
	end

	def update
	  task = Task.find(params[:id])
	  task.update_attributes(task_params)
	  render json: task
	end

	def show
	end

	def create
	  task = Task.create(task_params)
	  render json: task
	end

	private

	def task_params
	  params.require(:task).permit(:done, :title)
	end
end
