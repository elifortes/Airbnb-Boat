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
#Boat.create(title: "Example Boat",description: "A fantastic boat for all occasions.",price_per_unit: 150.0,reviews: 4,captain_name: "Captain John Doe",guest_capacity: 10,availability_from: Date.today + 15,availability_to: Date.today + 30,boat_maker_name: "Ocean Cruisers",boat_model: "CruiseMaster 2000",boat_size: "40 ft",year_made: 2018)
require "open-uri"
require 'faker'

# User.destroy_all
# new users
def users
user1 = User.new(
  :email                 => "ba@me.com",
  :password              => "123456",
  :password_confirmation => "123456"
).save!

user2 = User.new(
  :email                 => "cb@me.com",
  :password              => "123456",
  :password_confirmation => "123456"
).save!

user3 = User.new(
:email                 => "dc@me.com",
:password              => "123456",
:password_confirmation => "123456"
).save!
end



10.times do

name = Faker::FunnyName.name
boat = Boat.create(title:name  ,description: "A fantastic boat for all occasions.",price_per_unit: 150.0,reviews: 4,captain_name: "Captain John Doe",guest_capacity: 10,availability_from: Date.today + 15,availability_to: Date.today + 30,boat_maker_name: "Ocean Cruisers",boat_model: "CruiseMaster 2000",boat_size: "40 ft",year_made: 2018)
boat.user = User.all.sample
p boat.title
p boat.save!

end

10.times do

booking = Booking.new(start_date:Date.today + rand(1..7) ,end_date:Date.today + rand(7..17))
booking.user=  User.all.sample
booking.boat= Boat.all.sample
booking.status = false
p  booking.save!

end
