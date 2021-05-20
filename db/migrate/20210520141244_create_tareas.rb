class CreateTareas < ActiveRecord::Migration[6.1]
  def change
    create_table :tareas do |t|
      t.string :nombre
      t.string :item

      t.timestamps
    end
  end
end
