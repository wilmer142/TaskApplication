class ActivitiesController < ApplicationController

	before_action :set_task, only: [:create]

	#Creating new activity on task
	def create
		@activity = @task.activities.create(activity_params)
		redirect_to @task
	end

	private

		#Define validate arguments for activity
		def activity_params
			params.require(:activity).permit(:end_date, :hours, :description, :task_id)
		end

		#Setter for activity task
		def set_task
			@task = Task.find(params[:task_id])
		end
end