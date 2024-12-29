module Tasks
  class CreateTask
    def initialize(todo_list:, params:)
      @todo_list = todo_list
      @params = params
    end

    def call
      create_task
    end

    private

    def create_task
      task = @todo_list.tasks.new(@params)

      if task.save
        task
      else
        raise ActiveRecord::RecordInvalid, task
      end
    end
  end
end
