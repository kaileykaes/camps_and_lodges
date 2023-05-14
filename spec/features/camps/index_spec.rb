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

    it 'page has link to lodges index' do 
      visit "/camps/#{@dobbins.id}/lodges" 
      expect(page).to have_button("All Lodges")
      click_on 'All Lodges' 
      expect(current_path).to eq(lodges_path)
    end

    it 'page has link to camps index' do 
      visit "/camps/#{@dobbins.id}/lodges" 
      expect(page).to have_button('All Camps')
      click_on 'All Camps'
      expect(current_path).to eq(camps_path)
    end
  end
end