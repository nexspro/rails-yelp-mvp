require "faker"

puts "Delete old Data"
Restaurant.destroy_all

CATEGORIES = %w[chinese italian japanese french belgian philipine]

puts "Creating Restaurants"
10.times do
  restaurant = Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: CATEGORIES.sample
  )

  rand(1..10).times do
    Review.create!(
      content: Faker::Restaurant.review,
      rating: rand(0..5),
      restaurant: restaurant
    )
  end
end

puts "Tu as crée #{Restaurant.count} restaurants et #{Review.count} reviews"
