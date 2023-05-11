require 'rails_helper'

RSpec.describe "Camp" do 
  describe 'camp indices' do 
    it 'user sees name of each parent record in system' do 
      dobbins = Camp.create!(name: 'Camp Cris Dobbins', campground_number: 13, vacancy: true)
      visit "/camps" 
      expect(page).to have_content(dobbins.name)
    end

    it '/camps/:id shows particular camp with attributes' do 
      dobbins = Camp.create!(name: 'Camp Cris Dobbins', campground_number: 13, vacancy: true)
      dietler = Camp.create!(name: 'Camp Cortland Dietler', campground_number: 6, vacancy: false)
      magness = Camp.create!(name: 'Magness Adventure Camp', campground_number: 4, vacancy: true)
      visit "/camps/#{dobbins.id}" 
      expect(page).to have_content(dobbins.name)
      expect(page).to have_content(dobbins.campground_number)
      expect(page).to have_content(dobbins.vacancy)
      expect(page).to_not have_content(dietler.vacancy)
      expect(page).to_not have_content(magness.campground_number)
    end
  end
end