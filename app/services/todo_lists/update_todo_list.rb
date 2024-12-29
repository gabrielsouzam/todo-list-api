module TodoLists
  class UpdateTodoList
    def initialize(todo_list_id:, params:)
      @todo_list_id = todo_list_id
      @params = params
    end

    def call
      update_todo_list
    end

    private

    def update_todo_list
      todo_list = TodoList.find(@todo_list_id)

      if todo_list.update(@params)
        todo_list
      else
        raise ActiveRecord::RecordInvalid, todo_list
      end
    rescue ActiveRecord::RecordNotFound
      raise ActiveRecord::RecordNotFound, "TodoList não foi encontrada."
    end
  end
end
