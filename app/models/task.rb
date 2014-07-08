class Task < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true

  def new_task(task)
    current_user.task << task
  end

  def complete_task(task)
    task.update_attribute(:completed, true)
  end

  def delete_task(task)
    task.destroy
  end

end