class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.boolean :complete?
      t.text :description
      t.string :deadline
      t.integer :group_id
      t.timestamps null: false
    end
  end
end
