class AddPlatformIdToSubtask < ActiveRecord::Migration
  def change
    add_column :subtasks, :platform_id, :integer
  end
end
