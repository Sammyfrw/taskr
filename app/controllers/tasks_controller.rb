class TasksController < ApplicationController
  before_action :require_login 
  def index
    @tasks = current_user.tasks
    @task = Task.new
  end

  def create
    @task = current_user.tasks.create(task_params)
    redirect_to :tasks
  end



  private

  def task_params
    params.require(:task).permit(:title, :body)
  end


end