# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User created to test the production version with yopmail

1.times do 
  User.create!(
    email: "shynn@yopmail.com",
    password: Faker::Internet.password(8),
    description: "Bonjour les moussaillons, izi life gang gang pop hold it down",
    first_name: "Shynn",
    last_name: "Obi"
  )
end

19.times do 
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password(8),
    description: Faker::Hacker.say_something_smart,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end

puts "User created"

# Creation of a event related to the first user
1.times do
  Event.create(
    start_date: "2019-03-14",
    duration: 15,
    title: "Végane Burger Party",
    description: "Dégustation de burgers véganes au tofu, soja, seitan, tempeh à Lyon, ça va être la folie! <3",
    price: "5",
    location: "Lyon",
    user_id: 1
  )
end

9.times do
  Event.create(
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
  Attendance.create(
    stripe_customer_id: Faker::Number.number(10),
    user: User.all.sample,
    event: Event.all.sample 
  )
end

puts "Attendances created"