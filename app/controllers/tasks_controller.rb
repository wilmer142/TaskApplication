class TasksController < ApplicationController
  
  #Validating user for controller actions
  before_action :authenticate_user!, except: [:index_json, :index_json_user]

  #list all tasks by user and order by creation date
  def index
  	@tasks = current_user.tasks.order("created_at DESC")
  end

  #Render view to create a new task
  def new
  	@button = "Crear"
  	@task = current_user.tasks.build
  end

  #Create the new task
  def create
  	@task = current_user.tasks.build(task_params)
  	if @task.save
  		flash[:notice] = "Tarea creada correctamente"
  		redirect_to @task
  	else
  		flash[:notice] = "Ha ocurrido un error"
  		render 'new'
  	end
  end

  #Show and specific task with activities
  def show
  	@task = Task.find(params[:id])
  end

  private

  	#Define validate argument for task
  	def task_params
  		params.require(:task).permit(:description, :user_id)
  	end

end
