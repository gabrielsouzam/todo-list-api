class AddDefaultValuesToTodoList < ActiveRecord::Migration[6.1]
  def change
    change_column_default :todo_lists, :task_count, from: nil, to: 0
    change_column_default :todo_lists, :tasks_done, from: nil, to: 0
    change_column_default :todo_lists, :done, from: nil, to: false
  end
end
