class AddPlatformIdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :platform_id, :integer
  end
end
