class Task < ActiveRecord::Base
	PRIORITY_LEVELS = [['urgent', 1], ['high', 2], ['normal', 3], ['low', 4], ['lowest', 5]]
	STATUS_LEVELS = ['open', 'pending', 'postponed', 'closed']

	belongs_to :user
	belongs_to :platform
	has_many :subtasks

 	attr_accessible :description, :due_date, :priority, :status, :title, :platform_id, :user_id

  validates_presence_of :title, :priority, :status, :user

	def priority_name
		if priority == 5
			'lowest'
		elsif priority == 4
			'low'
		elsif priority == 3
			'normal'	
		elsif priority == 2
			'high'
		elsif priority == 1
			'urgent'
		end
	end

end
