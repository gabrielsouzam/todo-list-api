class Task < ApplicationRecord
  belongs_to :todo_list

  validates :title, presence: true
  validates :priority, inclusion: { in: %w[low medium high], message: "%{value} is not a valid priority" }

  after_create :increment_task_count
  after_destroy :decrement_task_count
  after_update :update_todo_list_tasks_done, if: :saved_change_to_done?

  private

  def increment_task_count
    todo_list.increment!(:task_count)
  end

  def decrement_task_count
    todo_list.decrement!(:task_count)
  end

  def update_todo_list_tasks_done
    todo_list.update(tasks_done: todo_list.tasks.where(done: true).count)
  end
end
