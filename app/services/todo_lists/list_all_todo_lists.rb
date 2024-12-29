module TodoLists
  class ListAllTodoLists
    def execute
      TodoList.all.order(created_at: :desc)
    end
  end
end
