require 'rails_helper'

RSpec.describe 'Lodges' do
  describe 'child indices' do 
    it '/lodges displays lodge index page' do
      dobbins = Camp.create!(name: 'Camp Cris Dobbins', campground_number: 13, vacancy: true)
      scout_craft = dobbins.lodges.create!(name: 'Scout Craft', director: 'Lauren Dewey', number_of_staff: 4, specialty_area: false)
      silver_lake = dobbins.lodges.create!(name: 'Silver Lake', director: 'Jake Burr', number_of_staff: 6, specialty_area: true)
      visit '/lodges' 
      expect(page).to have_content("Lodges")
      expect(page).to have_content("#{scout_craft.name}")
      expect(page).to have_content("Director: #{scout_craft.director}")
      expect(page).to have_content("Number of Staff: #{scout_craft.number_of_staff}")
      expect(page).to have_content("Specialty Area: #{scout_craft.specialty_area}")
      expect(page).to have_content("#{silver_lake.name}")
      expect(page).to have_content("Director: #{silver_lake.director}")
      expect(page).to have_content("Number of Staff: #{silver_lake.number_of_staff}")
      expect(page).to have_content("Specialty Area: #{silver_lake.specialty_area}")
    end

    it '/lodges/:id shows particular lodge with attributes' do 
      dobbins = Camp.create!(name: 'Camp Cris Dobbins', campground_number: 13, vacancy: true)
      scout_craft = dobbins.lodges.create!(name: 'Scout Craft', director: 'Lauren Dewey', number_of_staff: 4, specialty_area: false)
      silver_lake = dobbins.lodges.create!(name: 'Silver Lake', director: 'Jake Burr', number_of_staff: 6, specialty_area: true)
      visit "/lodges/#{scout_craft.id}"
      expect(page).to have_content("#{scout_craft.name}")
      expect(page).to have_content("Director: #{scout_craft.director}")
      expect(page).to have_content("Number of Staff: #{scout_craft.number_of_staff}")
      expect(page).to have_content("Specialty Area: #{scout_craft.specialty_area}")
      visit "lodges/#{silver_lake.id}"
      expect(page).to have_content("#{silver_lake.name}")
      expect(page).to have_content("Director: #{silver_lake.director}")
      expect(page).to have_content("Number of Staff: #{silver_lake.number_of_staff}")
      expect(page).to have_content("Specialty Area: #{silver_lake.specialty_area}")
    end
  end
end