# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User created to test the production version with yopmail

Attendance.destroy_all
Event.destroy_all
User.destroy_all

puts "Database cleaned"

25.times do 
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password(8),
    description: Faker::Hacker.say_something_smart,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end

puts "User created"

20.times do
  Event.create!(
    start_date: Faker::Date.forward(10),
    duration: 15,
    title: Faker::Lorem.sentence(4),
    description: Faker::Lorem.paragraph(4),
    price: Faker::Number.between(1, 1000),
    location: Faker::Zelda.location,
    user_id: rand(1..20)
  )
end

puts "Events created"

30.times do 
  Attendance.create!(
    stripe_customer_id: Faker::Number.number(10),
    user: User.all.sample,
    event: Event.all.sample 
  )
end

puts "Attendances created"