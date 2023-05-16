require 'rails_helper'

RSpec.describe 'Lodges' do
  before :each do 
    @dobbins = Camp.create!(name: 'Camp Cris Dobbins', campground_number: 13, vacancy: true)
    @scoutcraft = @dobbins.lodges.create!(name: 'Scout Craft', director: 'Lauren Dewey', number_of_staff: 4, specialty_area: false)
    @silver_lake = @dobbins.lodges.create!(name: 'Silver Lake', director: 'Jake Burr', number_of_staff: 6, specialty_area: true)
  end 
  describe 'child indices' do 
    it '/lodges displays lodge index page' do
      visit '/lodges' 
      expect(page).to have_content("Lodges")
      expect(page).to have_content("#{@scoutcraft.name}")
      expect(page).to have_content("Director: #{@scoutcraft.director}")
      expect(page).to have_content("Number of Staff: #{@scoutcraft.number_of_staff}")
      expect(page).to have_content("Specialty Area: #{@scoutcraft.specialty_area}")
      expect(page).to have_content("#{@silver_lake.name}")
      expect(page).to have_content("Director: #{@silver_lake.director}")
      expect(page).to have_content("Number of Staff: #{@silver_lake.number_of_staff}")
      expect(page).to have_content("Specialty Area: #{@silver_lake.specialty_area}")
    end

    it '/lodges/:id shows particular lodge with attributes' do 
      visit "/lodges/#{@scoutcraft.id}"
      expect(page).to have_content("#{@scoutcraft.name}")
      expect(page).to have_content("Director: #{@scoutcraft.director}")
      expect(page).to have_content("Number of Staff: #{@scoutcraft.number_of_staff}")
      expect(page).to have_content("Specialty Area: #{@scoutcraft.specialty_area}")
      visit "lodges/#{@silver_lake.id}"
      expect(page).to have_content("#{@silver_lake.name}")
      expect(page).to have_content("Director: #{@silver_lake.director}")
      expect(page).to have_content("Number of Staff: #{@silver_lake.number_of_staff}")
      expect(page).to have_content("Specialty Area: #{@silver_lake.specialty_area}")
    end
    
    it 'page has link to lodges index' do 
      visit "/camps/#{@dobbins.id}/lodges" 
      expect(page).to have_button('All Lodges')
      click_on 'All Lodges' 
      expect(current_path).to eq(lodges_path)
    end

    it 'page has link to camps index' do 
      visit "/camps/#{@dobbins.id}/lodges" 
      expect(page).to have_button('All Camps')
      click_on 'All Camps'
      expect(current_path).to eq(camps_path)
    end

    it 'only specialty areas are displayed on Lodges index page' do 
      visit '/lodges' 
      expect(page).to_not have_content('false')
      expect(page).to_not have_content(@scoutcraft.name)
      expect(page).to have_content(@silver_lake.director)
    end
  end

end