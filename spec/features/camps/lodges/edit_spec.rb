require 'rails_helper'

RSpec.describe 'crud functionality' do 
  before(:each) do 
    @dobbins = Camp.create!(name: 'Camp Cris Dobbins', campground_number: 13, vacancy: true)
    @scout_craft = @dobbins.lodges.create!(name: 'Scout Craft', director: 'Lauren Dewey', number_of_staff: 4, specialty_area: false)
    @silver_lake = @dobbins.lodges.create!(name: 'Silver Lake', director: 'Jake Burr', number_of_staff: 6, specialty_area: true)
    @the_ool = @dobbins.lodges.create!(name: 'The Ool', director: 'Evan Dorrough', number_of_staff: 6, specialty_area: true)
  end
  
  describe 'update lodges' do 
    it 'lodges can be updated' do 
      visit "/lodges/#{@the_ool.id}"
      expect(page).to have_button('Update Lodge')
      click_button 'Update Lodge'
      expect(current_path).to eq("/lodges/#{@the_ool.id}/edit")
      fill_in 'Name', with: 'Pool Area'
      fill_in 'Director', with: 'Connor Black'
      fill_in 'Number of Staff', with: 5
      check 'Specialty Area'
      click_button 'Update Lodge'
      expect(current_path).to eq("/lodges/#{@the_ool.id}")
      expect(page).to have_content("Director: Connor Black")
    end
  end
end

# User Story 14, Child Update 

# As a visitor
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information