class CompletedTasksController < ApplicationController
  def index
    @tasks = current_user.tasks.where(completed: true)
  end

end