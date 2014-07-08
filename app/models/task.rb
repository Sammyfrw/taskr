class Task < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true

  def new_task(task)
    current_user.new
  end

  def complete_task(task)
    task.update_attribute(:completed, true)
  end

  def delete_task(task)
    task.destroy
  end

end