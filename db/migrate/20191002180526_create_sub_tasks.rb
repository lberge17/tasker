class CreateSubTasks < ActiveRecord::Migration
  def change
    create_table :sub_tasks do |t|
      t.string :content
      t.boolean :complete?
      t.integer :task_id
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
