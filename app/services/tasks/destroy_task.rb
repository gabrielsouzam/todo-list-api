module Tasks
  class DestroyTask
    def initialize(task_id:)
      @task_id = task_id
    end

    def execute
      destroy_task
    end

    private

    def destroy_task
      task = Task.find(@task_id)
      task.destroy
    rescue ActiveRecord::RecordNotFound
      raise ActiveRecord::RecordNotFound, "Task não foi encontrada."
    end
  end
end
