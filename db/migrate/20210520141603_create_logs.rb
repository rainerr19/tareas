class CreateLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :logs do |t|
      t.string :name
      t.string :action
      t.text :description

      t.timestamps
    end
  end
end
