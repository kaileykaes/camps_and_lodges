# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

dobbins = Camp.create!(name: 'Camp Cris Dobbins', campground_number: 13, vacancy: true)
dietler = Camp.create!(name: 'Camp Cortland Dietler', campground_number: 6, vacancy: false)
magness = Camp.create!(name: 'Magness Adventure Camp', campground_number: 4, vacancy: true)
scout_craft = dobbins.lodges.create!(name: 'Scout Craft', director: 'Lauren Dewey', number_of_staff: 4, specialty_area: false)
silver_lake = dobbins.lodges.create!(name: 'Silver Lake', director: 'Jake Burr', number_of_staff: 6, specialty_area: true)
