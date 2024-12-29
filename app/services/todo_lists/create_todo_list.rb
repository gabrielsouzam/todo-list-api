module TodoLists
  class CreateTodoList
    def initialize(params:)
      @params = params
    end

    def call
      create_todo_list
    end

    private

    def create_todo_list
      todo_list = TodoList.new(@params)

      if todo_list.save
        todo_list
      else
        raise ActiveRecord::RecordInvalid, todo_list
      end
    end
  end
end
