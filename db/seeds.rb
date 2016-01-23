# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

# Create users & objectives

5.times do
  password = Faker::Internet.password
  user = User.new(
    username: Faker::Name.name,
    email: Faker::Internet.email,
    password: password,
    password_confirmation: password)
  
  user.skip_confirmation! # sets confirmation date to avoid sending an email
  user.save # updates database
end

user_first = User.first
user_first.update_attributes(username: Faker::Name.name, password: ENV['DEFAULT_PASSWORD'], password_confirmation: ENV['DEFAULT_PASSWORD'])
user_first.skip_confirmation!
user_first.save

user_last = User.last
user_last.update_attributes(username: Faker::Name.name, password: ENV['DEFAULT_PASSWORD'], password_confirmation: ENV['DEFAULT_PASSWORD'])
user_last.skip_confirmation!
user_last.save

puts "Seeds finished"
puts "#{User.count} users created"