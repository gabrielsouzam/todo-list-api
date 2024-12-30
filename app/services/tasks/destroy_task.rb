module Tasks
  class DestroyTask
    def initialize(task_id:)
      @task_id = task_id
    end

    def call
      destroy_task
    end

    private

    def destroy_task
      task = Task.find(@task_id)
      todo_list = task.todo_list

      ActiveRecord::Base.transaction do
        if task.done
          todo_list.update!(tasks_done: todo_list.tasks_done - 1)
        end

        task.destroy!
      end

      todo_list
    rescue ActiveRecord::RecordNotFound
      raise ActiveRecord::RecordNotFound, "Task não foi encontrada."
    end
  end
end
