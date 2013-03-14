class CreateSubtasks < ActiveRecord::Migration
  def change
    create_table :subtasks do |t|
      t.string :title
      t.text :description
      t.date :due_date
      t.integer :priority, :default => 3
      t.string :status, :default => 'open'
      t.integer :task_id

      t.timestamps
    end
  end
end