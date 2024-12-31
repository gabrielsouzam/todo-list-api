module TodoLists
  class ListUserTodoLists
    def initialize(user_id)
      @user_id = user_id
    end

    def call
      TodoList.where(user_id: @user_id).order(created_at: :desc)
    end
  end
end
