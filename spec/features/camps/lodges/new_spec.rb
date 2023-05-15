require 'rails_helper'

RSpec.describe 'new lodges creation' do 
  before(:each) do 
    @dobbins = Camp.create!(name: 'Camp Cris Dobbins', campground_number: 13, vacancy: true)
    @scout_craft = @dobbins.lodges.create!(name: 'Scout Craft', director: 'Lauren Dewey', number_of_staff: 4, specialty_area: false)
    @silver_lake = @dobbins.lodges.create!(name: 'Silver Lake', director: 'Jake Burr', number_of_staff: 6, specialty_area: true)
  end
  describe '/camps/:camp_id/lodges/new' do 
    it 'create lodges' do 
      visit camp_lodges_path(@dobbins)
      expect(page).to have_link('Create Lodge')
      click_on 'Create Lodge' 
      expect(current_path).to eq("/camps/#{@dobbins.id}/lodges/new")
      fill_in 'Name', with: "The 'Ool"
      fill_in 'Director', with: "Connor Black"
      fill_in 'Number of Staff', with: 5
      check 'Specialty Area'
      click_button 'Create Lodge'
      expect(current_path).to eq(camp_lodges_path(@dobbins))
      expect(page).to have_content("The 'Ool")
    end
  end
 
  
 
  # And I click the button "Create Child"
  # Then a `POST` request is sent to '/camps/:parent_id/lodges',
  # a new child object/row is created for that parent,
  # and I am redirected to the Parent Childs Index page where I can see the new child listed
end