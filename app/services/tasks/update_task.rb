module Tasks
  class UpdateTask
    def initialize(task_id:, params:)
      @task_id = task_id
      @params = params
    end

    def execute
      update_task
    end

    private

    def update_task
      task = Task.find(@task_id)

      if task.update(@params)
        task
      else
        raise ActiveRecord::RecordInvalid, task
      end
    rescue ActiveRecord::RecordNotFound
      raise ActiveRecord::RecordNotFound, "Task não foi encontrada."
    end
  end
end
