# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Assuming your Boat model has the following attributes: title, description, price_per_unit, reviews, captain_name, guest_capacity, availability_from, availability_to, boat_maker_name, boat_model, boat_size, year_made, and photos.

# Create 5 fake boat records
Boat.create(title: "Example Boat",description: "A fantastic boat for all occasions.",price_per_unit: 150.0,reviews: 4,captain_name: "Captain John Doe",guest_capacity: 10,availability_from: Date.today + 15,availability_to: Date.today + 30,boat_maker_name: "Ocean Cruisers",boat_model: "CruiseMaster 2000",boat_size: "40 ft",year_made: 2018)
