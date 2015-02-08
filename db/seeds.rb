# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#
# Admin users
#

admin1 = User.create!(
  role: "admin",
  first_name: ENV['ADMIN_FIRSTNAME'],
  last_name: ENV['ADMIN_LASTNAME'],
  email: ENV['ADMIN_EMAIL'],
  password: ENV['ADMIN_PASSWORD'],
  password_confirmation: ENV['ADMIN_PASSWORD']
)
admin2 = User.create!(
  role: "admin",
  first_name: ENV['ADMIN2_FIRSTNAME'],
  last_name: ENV['ADMIN2_LASTNAME'],
  email: ENV['ADMIN2_EMAIL'],
  password: ENV['ADMIN2_PASSWORD'],
  password_confirmation: ENV['ADMIN2_PASSWORD']
)
puts "CREATED ADMIN USERS: #{admin1.email}, #{admin2.email}"

#
# Regular users
#

alice = User.create!(
  role: "regular",
  first_name: "Alice",
  last_name: "Example",
  email: "alice@example.com",
  password: "alicealice",
  password_confirmation: "alicealice"
)
bob = User.create!(
  role: "regular",
  first_name: "Bob",
  last_name: "Example",
  email: "bob@example.com",
  password: "bobbob",
  password_confirmation: "bobbob"
)