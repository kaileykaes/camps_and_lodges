require 'rails_helper'

RSpec.describe 'new camp form tests' do 
  describe 'crud functionality' do 
    it 'can add a new camp' do 
      visit '/camps'
      expect(page).to have_link('New Camp')
      click_on 'New Camp'
      expect(current_path).to eq('/camps/new')
      fill_in 'Name', with: 'Philmont Scout Ranch'
      fill_in 'Campground Number', with: 8
      fill_in 'Vacancy', with: false
      click_on 'Create Camp'
      expect(current_path).to eq('/camps')
      expect(page).to have_content('Philmont Scout Ranch')
    end
  end
end