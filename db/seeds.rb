gem 'faker'
User.destroy_all
Licorne.destroy_all
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Faker::Config.locale = 'fr'

puts "Creating Users..."
10.times do
  user = User.new(
    first_name: Faker::Name.first_name.strip,
    last_name: Faker::Name.last_name.strip,
    password: "password",
    address: Faker::Address.city,
  )
  user.email = "#{user.first_name}.#{user.last_name}@gmail.com"
  user.save!
end
puts "Users created !!"

puts "Creating licornes..."

rand = 1

10.times do  
licorne = Licorne.new(
    name: Faker::Music::Opera.unique.mozart_italian,
    superpower: Faker::Games::Pokemon.move,
    price: rand(500..1500),
    age: rand(2..999),
  )
  file = File.open("app/assets/images/licorne#{rand}.jpg")
  licorne.photo.attach(io: file, filename: "licorne#{rand}}.jpg", content_type: "image/jpg")
  licorne.user = User.first(5).sample
  licorne.latitude = licorne.user.latitude
  licorne.longitude = licorne.user.longitude
  rand += 1
  licorne.save!
end
puts "Licornes created !!"
