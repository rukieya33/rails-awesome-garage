require 'open-uri'
require "json"
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Cleaning up database..."
Car.destroy_all
puts "Database cleaned"
def car_make
  url = "https://carapi.app/api/makes?page=1&limit=3"
  user_serialized = URI.parse(url).read
  user = JSON.parse(user_serialized)

  return user["data"]
end

def car_model
  url = "https://carapi.app/api/models?page=1&limit=3"
  user_serialized = URI.parse(url).read
  user = JSON.parse(user_serialized)

  return user["data"]
end

fuels = ["Diesel", "Petrol", "Super Unleaded"]
owners = ["Jon bull", "crazy sky", "cool george"]
car_model = ["hyndai sprint gz", "Toyota sky alpha 3000", "333" ]
puts "creating cars ..."
i = 0
until i == 3
  owner = Owner.create(nickname: owners[i])
  owner.save
  Car.create!(brand: car_make[i]["name"], model:car_model[i], year: 2020 + i, fuel: fuels[i], owner_id: owner.id)
  i += 1
end

puts "total number of cars created: #{Car.count}"
