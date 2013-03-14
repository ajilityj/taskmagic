class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.date :due_date
      t.integer :priority, :default => 3
      t.string :status, :default => 'open'

      t.timestamps
    end
  end
end
