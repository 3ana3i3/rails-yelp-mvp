# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts 'Cleaning database...'
Review.destroy_all
Restaurant.destroy_all

puts 'Creating restaurants...'

dishoom = Restaurant.create!(name: 'Dishoom', address: '7 Boundary St, London E2 7JE', category: 'indian')
puts 'Created Dishoom'
pizza_east = Restaurant.create!(name: 'Pizza East', address: '56A Shoreditch High St, London E1 6PQ', category: 'italian')
puts 'Created Pizza East'

puts 'Creating reviews...'
Review.create!(content: 'Amazing!', rating: 5, restaurant: dishoom)
Review.create!(content: 'Good!', rating: 4, restaurant: dishoom)
Review.create!(content: 'Great pizza', rating: 5, restaurant: pizza_east)

puts "Finished! Created #{Restaurant.count} restaurants and #{Review.count} reviews."
