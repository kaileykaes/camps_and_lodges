require 'rails_helper'

RSpec.describe "Camp" do 
  describe 'camp indices' do 

    before(:each) do 
      @dobbins = Camp.create!(name: 'Camp Cris Dobbins', campground_number: 13, vacancy: true)
      @dietler = Camp.create!(name: 'Camp Cortland Dietler', campground_number: 6, vacancy: false)
      @magness = Camp.create!(name: 'Magness Adventure Camp', campground_number: 4, vacancy: true)
    end

    it 'user sees name of each parent record in system' do   
      visit "/camps" 
      expect(page).to have_content(@dobbins.name)
    end

    it '/camps/:id shows particular camp with attributes' do 
      visit "/camps/#{@dobbins.id}" 
      expect(page).to have_content(@dobbins.name)
      expect(page).to have_content(@dobbins.campground_number)
      expect(page).to have_content(@dobbins.vacancy)
      expect(page).to_not have_content(@dietler.vacancy)
      expect(page).to_not have_content(@magness.campground_number)
    end
    
    it '/camps records show and are ordered by created_at time stamps' do 
      visit '/camps'
      expect(@magness.name).to appear_before(@dietler.name)
      expect(@dietler.name).to appear_before(@dobbins.name)
      expect(@dobbins.name).to_not appear_before(@magness.name)
    end

    it '/camps records show on camp index page with created_at displayed adjacent' do 
      visit '/camps' 
      expect(page).to have_content("Record Created At: #{@magness.created_at}")
      expect(page).to have_content(@dobbins.created_at)
      expect(page).to have_content(@dietler.created_at)
    end

    it '/camps/:id shows number of associated lodges' do
      scout_craft = @dobbins.lodges.create!(name: 'Scout Craft', director: 'Lauren Dewey', number_of_staff: 4, specialty_area: false)
      silver_lake = @dobbins.lodges.create!(name: 'Silver Lake', director: 'Jake Burr', number_of_staff: 6, specialty_area: true)
      visit "/camps/#{@dobbins.id}"
      save_and_open_page
      expect(page).to have_content("Number of Lodges: #{@dobbins.lodges.count}")
    end
  end
end