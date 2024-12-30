module Tasks
  class UpdateTaskStatus
    def initialize(task_id, done_status)
      @task_id = task_id
      @done_status = done_status
    end

    def call
      task = Task.find(@task_id)
      task.update!(done: @done_status)
      task.todo_list.update!(tasks_done: task.todo_list.tasks.where(done: true).count)
      task
    rescue ActiveRecord::RecordNotFound
      raise "Task not found"
    rescue ActiveRecord::RecordInvalid => e
      raise "Failed to update task: #{e.message}"
    end
  end
end
