class TasksController < ApplicationController
  before_action :require_login 
  def index
    @tasks = current_user.tasks.where(completed: false)
    @task = Task.new  
  end

  def create

    @task = current_user.tasks.new(task_params)
    @tasks = current_user.tasks.not_completed.
      order("created_at DESC")

      if @task.save
        # render partial: "tasks/task", task: @task
        render @tasks
      end
  end

  def update
    @task = current_user.tasks.find(params[:id])
    @task.complete_task(@task)
    redirect_to :tasks
  end

  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.delete_task(@task)
    redirect_to :tasks
  end

  private

  def task_params
    params.require(:task).permit(:title, :body)
  end


end