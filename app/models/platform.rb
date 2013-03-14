class Platform < ActiveRecord::Base
  has_many :tasks

  attr_accessible :name

  validates_presence_of :name
  validates_uniqueness_of :name

end
