require 'rails_helper'

RSpec.describe 'crud functionality' do 
  describe 'update' do 
    before(:each) do 
      @dobbins = Camp.create!(name: 'Camp Cris Dobbins', campground_number: 13, vacancy: true)
      @dietler = Camp.create!(name: 'Camp Cortland Dietler', campground_number: 6, vacancy: false)
      @magness = Camp.create!(name: 'Magness Adventure Camp', campground_number: 4, vacancy: true)
    end

    it 'update camp info' do 
      visit "/camps/#{@magness.id}"
      expect(page).to have_link('Update Camp')
      click_link 'Update Camp'
      expect(current_path).to eq("/camps/#{@magness.id}/edit")
      fill_in 'Name', with: 'Magness Adventure Camp'
      fill_in 'Campground Number', with: 4
      fill_in 'Vacancy', with: true
      click_on 'Update Camp'
      expect(current_path).to eq("/camps/#{@magness.id}")
      expect(page).to have_content(@magness.name)
      expect(page).to have_content(@magness.campground_number)
      expect(page).to have_content(@magness.vacancy)
      expect(@magness.updated_at).to_not eq(nil)
      expect(@magness.campground_number).to eq(4)
      expect(@magness.vacancy).to eq(true)
      expect(@magness.name).to eq('Magness Adventure Camp')
    end
  end
end