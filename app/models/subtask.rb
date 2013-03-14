class Subtask < ActiveRecord::Base
  belongs_to :task
  belongs_to :platform
  belongs_to :user

  attr_accessible :description, :due_date, :priority, :status, :task_id, :title, :platform_id, :user_id

  validates_presence_of :title, :task, :priority, :status, :platform, :user

  # subtask should not be due after tasks's due date
  # subtask should not have a priority lower than it's task's priority

  # update subtask priority level if task priority level is raised

  # validate :priority_level

  # def priority_level
  #   if self.priority < self.task.priority
  #     self.errors.add(:priority, "must equal or be higher than it's parent's priority level (#{self.task.priority_name.capitalize}).")
  #   end
  # end

  def priority_name
    if priority == 1
      "lowest"
    elsif priority == 2
      "low"
    elsif priority == 3
      "normal"  
    elsif priority == 4
      "high"
    elsif priority == 5
      "urgent"
    end
  end
end
