class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks, id: :uuid do |t|
      t.string :title
      t.text :description
      t.string :priority
      t.boolean :done
      t.datetime :deadline
      t.integer :position
      t.references :todo_list, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
