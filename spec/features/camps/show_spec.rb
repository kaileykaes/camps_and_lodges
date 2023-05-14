require 'rails_helper'

RSpec.describe 'camps show view tests' do 
  before(:each) do 
    @dobbins = Camp.create!(name: 'Camp Cris Dobbins', campground_number: 13, vacancy: true)
      @dietler = Camp.create!(name: 'Camp Cortland Dietler', campground_number: 6, vacancy: false)
      @magness = Camp.create!(name: 'Magness Adventure Camp', campground_number: 4, vacancy: true)
  end

  describe 'content' do 
    it '/camps/:id shows particular camp with attributes' do 
      visit "/camps/#{@dobbins.id}" 
      expect(page).to have_content(@dobbins.name)
      expect(page).to have_content(@dobbins.campground_number)
      expect(page).to have_content(@dobbins.vacancy)
      expect(page).to_not have_content(@dietler.vacancy)
      expect(page).to_not have_content(@magness.campground_number)
    end
  end

  describe 'active record features' do 
    it '/camps/:id shows number of associated lodges' do
      scout_craft = @dobbins.lodges.create!(name: 'Scout Craft', director: 'Lauren Dewey', number_of_staff: 4, specialty_area: false)
      silver_lake = @dobbins.lodges.create!(name: 'Silver Lake', director: 'Jake Burr', number_of_staff: 6, specialty_area: true)
      visit "/camps/#{@dobbins.id}"
      expect(page).to have_content("Number of Lodges: #{@dobbins.lodges.count}")
    end
  end

  describe 'usability' do 
    it 'camps/:id has link for /camps/:id/lodges' do 
      visit "/camps/#{@dobbins.id}"
      expect(page).to have_button("#{@dobbins.name} Lodges")
      click_on "#{@dobbins.name} Lodges" 
      expect(current_path).to eq(camp_lodges_path(@dobbins))
    end
  end
end