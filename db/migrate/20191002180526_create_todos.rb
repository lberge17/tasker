class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :content
      t.boolean :complete?
      t.integer :task_id
      t.integer :assigned_id
      t.timestamps null: false
    end
  end
end
