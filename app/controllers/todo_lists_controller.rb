class TodoListsController < ApplicationController
  protect_from_forgery with: :null_session, if: -> { request.format.json? }
  def create
    params_for_todo_list = todo_list_params

    begin
      todo_list = TodoLists::CreateTodoList.new(params: params_for_todo_list).call
      render json: { todo_list: todo_list }, status: :created
    rescue ActiveRecord::RecordInvalid => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end

  def show
    todo_list = TodoLists::ShowTodoListService.new(params[:id]).call

    if todo_list
      render json: { todo_list: todo_list }, status: :ok
    else
      render json: { error: "TodoList não encontrada." }, status: :not_found
    end
  end

  def update
    params_for_update = todo_list_params

    begin
      todo_list = TodoLists::UpdateTodoList.new(todo_list_id: params[:id], params: params_for_update).call
      render json: { todo_list: todo_list }, status: :ok
    rescue ActiveRecord::RecordInvalid => e
      render json: { error: e.message }, status: :unprocessable_entity
    rescue ActiveRecord::RecordNotFound
      render json: { error: "TodoList não foi encontrada." }, status: :not_found
    end
  end

  def destroy
    begin
      TodoLists::DestroyTodoList.new(todo_list_id: params[:id]).call
      render json: { message: "TodoList deletada." }, status: :ok
    rescue ActiveRecord::RecordNotFound
      render json: { error: "TodoList não foi encontrada." }, status: :not_found
    end
  end

  def tasks
    begin
      tasks = TodoLists::ListTasks.new(todo_list_id: params[:id]).call
      render json: { tasks: tasks }, status: :ok
    rescue ActiveRecord::RecordNotFound => _
      render json: { error: "TodoList não foi encontrada." }, status: :not_found
    end
  end

  def index
    user_id = params[:user_id]
    if user_id
      todo_lists = TodoLists::ListUserTodoLists.new(user_id).call
      render json: { todo_lists: todo_lists }, status: :ok
    else
      render json: { error: "User ID is required" }, status: :unprocessable_entity
    end
  end


  private

  def todo_list_params
    params.require(:todo_list).permit(:title, :subtitle, :scope, :task_count, :tasks_done, :done, :icon, :color, :priority, :user_id)
  end
end
