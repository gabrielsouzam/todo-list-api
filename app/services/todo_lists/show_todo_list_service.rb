module TodoLists
  class ShowTodoListService
    def initialize(id)
      @id = id
    end

    def execute
      TodoList.find(@id)
    rescue ActiveRecord::RecordNotFound
      nil
    end
  end
end
