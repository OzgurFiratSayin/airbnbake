# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Review.destroy_all
Order.destroy_all
Cake.destroy_all
User.destroy_all
emma = User.create(
  email:'emma@abc.com',
  password: 'Abc1234.',
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  address: Faker::Address.full_address
  )
10.times do
  puts "creating user"
  city = ["Izmir", "Westcliff-On-Sea", "Istanbul", "Sao Paulo", "Etrechy", "Roubaix", "Lille", "London", "Paris", "Durham", "Brighton", "Leigh-On-Sea", "Antalia", "Rio de Janeiro", "Glasgow", "Twickenham", "Manchester", "Galway", "Bristol", "Leeds", "Brussels", "Mitcham", "Ealing"]
  User.create!(
    email: Faker::Internet.email,
    password: 'Abc1234.',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: city.sample
    )
  puts "user created"
end

for i in 1..24 do
  puts 'creating cake'
  desc = ["Decadent cake, perfect for every occasions! ", "Creamy with a bit of crunch, perfect for work parties. 🥂", "Fruity cake.", "🍋 Fresh and zingy. 🍋", "A chocolate dream.", "Colorful cake with melted white chocolate.", "🥳 Perfect for children's party 🥳", "Rich and nutty! 🌰"]
  cake = Cake.create!(
    name: Faker::Food.fruits,
    price: rand(1..10).to_s,
    description: desc.sample,
    size: "#{rand(15..35)}cm",
    user_id: User.all.sample.id)
  cake.photos.attach(io: File.open("app/assets/images/seed_images/cakes/cake#{i}.jpg"), filename: "cake#{i}.jpg")
  puts "cake created"
end

10.times do
  puts 'creating orders'
  Order.create!(
    order_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
    user_id: User.all.sample.id,
    cake_id: Cake.all.sample.id
    )
end

10.times do
  puts 'creating orders'
  Order.create!(
    order_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
    user_id: emma.id,
    cake_id: Cake.all.sample.id
    )
end


