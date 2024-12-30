class TasksController < ApplicationController
  def create
    params_for_task = task_params

    begin
      todo_list = TodoList.find(params_for_task[:todo_list_id])
      task = Tasks::CreateTask.new(todo_list: todo_list, params: params_for_task.except(:todo_list_id)).call
      render json: { task: task }, status: :created
    rescue ActiveRecord::RecordInvalid => e
      render json: { error: e.message }, status: :unprocessable_entity
    rescue ActiveRecord::RecordNotFound
      render json: { error: "TodoList não foi encotrada." }, status: :not_found
    end
  end

  def update_status
    begin
      task = Tasks::UpdateTaskStatus.new(params[:id], params[:done]).call
      render json: { task: task }, status: :ok
    rescue => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end

  def update
    begin
      task = Tasks::UpdateTask.new(task_id: params[:id], params: task_params).call
      render json: { task: task, message: "Task alterada com sucesso" }, status: :ok
    rescue ActiveRecord::RecordInvalid => e
      render json: { error: e.message }, status: :unprocessable_entity
    rescue ActiveRecord::RecordNotFound
      render json: { error: "Task não foi encontrada." }, status: :not_found
    end
  end

  def destroy
    begin
      Tasks::DestroyTask.new(task_id: params[:id]).call
      render json: { message: "Task deletada com sucesso" }, status: :ok
    rescue ActiveRecord::RecordNotFound
      render json: { error: "Task não foi encontrada." }, status: :not_found
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :priority, :done, :deadline, :position, :todo_list_id)
  end
end
