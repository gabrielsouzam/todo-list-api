class CreateTodoLists < ActiveRecord::Migration[8.0]
  def change
    create_table :todo_lists, id: :uuid do |t|
      t.string :title
      t.text :subtitle
      t.string :scope
      t.integer :task_count
      t.integer :tasks_done
      t.boolean :done
      t.string :icon
      t.string :color
      t.string :priority

      t.timestamps
    end
  end
end
