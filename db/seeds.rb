gem 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Creating licornes..."
20.times do
  licorne = Licorne.new(
    name: Faker::Music::Opera.unique.mozart_italian,
    price: rand(500..1500),
    age: rand(2..999),
  )
  licorne.save!
end
puts "Licornes created !!"

puts "Creating Users..."
20.times do
  user = User.new(
    first_name: Faker::Name.unique.first_name,
    last_name: Faker::Name.unique.last_name,
    email: "#{first_name}.#{last_name}@gmail.com",
    password: "password",
    address: Faker::Address.full_address,
  )
  user.save!
end
puts "Users created !!"
