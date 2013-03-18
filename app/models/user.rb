class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :admin

  has_secure_password

  validates_uniqueness_of :email
end
