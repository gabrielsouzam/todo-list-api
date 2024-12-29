class UpdateTasksTable < ActiveRecord::Migration[8.0]
  def change
    # Alterar o campo `done` para ter `false` como valor padrão
    change_column_default :tasks, :done, from: nil, to: false

    # Remover a coluna `position`
    remove_column :tasks, :position, :integer
  end
end
