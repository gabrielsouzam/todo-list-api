module TodoLists
  class DestroyTodoList
    def initialize(todo_list_id:)
      @todo_list_id = todo_list_id
    end

    def call
      destroy_todo_list
    end

    private

    def destroy_todo_list
      todo_list = TodoList.find(@todo_list_id)
      todo_list.destroy
    rescue ActiveRecord::RecordNotFound
      raise ActiveRecord::RecordNotFound, "TodoList não foi encontrada."
    end
  end
end
