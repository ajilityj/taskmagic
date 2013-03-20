# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

platforms = [
  {name: 'Shure.com'},
  {name: 'Blog'},
  {name: 'Shopatron'},
  {name: 'Brightcove'},
  {name: 'EmailDirect'},
  {name: 'Facebook'}
]

Platform.destroy_all
platforms.each do |platform_hash|
  p = Platform.new
  p.name = platform_hash[:name]
  p.save
end

users = [
  {name: 'Admin', email: 'admin', password: 'admin', password_confirmation: 'admin', admin: true},
  {name: 'Magic', email: 'magic', password: 'magic', password_confirmation: 'magic', admin: true},
  {name: 'Larry', email: 'larry', password: 'larry', password_confirmation: 'larry', admin: false},
  {name: 'A-Dubs', email: 'adubs', password: 'adubs', password_confirmation: 'adubs', admin: false},
  {name: 'Dobber', email: 'dobber', password: 'dobber', password_confirmation: 'dobber', admin: false}        
]

User.destroy_all
users.each do |user_hash|
  u = User.new
  u.name = user_hash[:name]
  u.email = user_hash[:email]
  u.password = user_hash[:password]
  u.password_confirmation = user_hash[:password_confirmation]
  u.admin = user_hash[:admin]
  u.save
end

Task.destroy_all
tasks.each do |task_hash|
  t = Task.new
  t.title = "Random Task ##{rand(1000)}"
  t.description = ""
  t.due_date = rand(6.months).from_now
  t.priority = rand(1..5)
  t.status = Task::STATUS_LEVELS.sample(1).first
  t.platform_id = Platform.all.sample(1).first.id
  t.user_id = User.all.sample(1).first.id
  t.save
end


Subtask.destroy_all
