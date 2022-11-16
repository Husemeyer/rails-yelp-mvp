# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning database"
Restaurant.destroy_all
Review.destroy_all

puts "Creating restaurants and reviews"

20.times do
  restaurant = Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber,
    category: Faker::Food.ethnic_category
  )

    5.times do
      review = Review.create(
        content: Faker::Restaurant.description,
        rating: rand(1..5),
        restaurant_id: restaurant.id
      )
      puts "Review for restaurant: #{review.id} has been created"
    end
  puts "Restaurant with id: #{restaurant.id} has been created"
end

puts "Finished"
