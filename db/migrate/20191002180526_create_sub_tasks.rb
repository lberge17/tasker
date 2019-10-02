class CreateSubTasks < ActiveRecord::Migration
  def change
    create_table :sub_tasks do |t|

      t.timestamps null: false
    end
  end
end
