class DropTodoListsAndTasks < ActiveRecord::Migration[8.0]
  def change
    drop_table :tasks
    drop_table :todo_lists
  end
end
