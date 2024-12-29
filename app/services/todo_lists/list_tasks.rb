module TodoLists
  class ListTasks
    def initialize(todo_list_id:)
      @todo_list_id = todo_list_id
    end

    def call
      list_tasks
    end

    private

    def list_tasks
      todo_list = TodoList.find(@todo_list_id)
      todo_list.tasks
    rescue ActiveRecord::RecordNotFound
      raise ActiveRecord::RecordNotFound, "TodoList não foi encontrada."
    end
  end
end
