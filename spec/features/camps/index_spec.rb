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
      expect(page).to have_content("Number of Lodges: #{@dobbins.lodges.count}")
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

    it 'camps/:id has link for /camps/:id/lodges' do 
      visit "/camps/#{@dobbins.id}"
      expect(page).to have_button("#{@dobbins.name} Lodges")
      click_on "#{@dobbins.name} Lodges" 
      expect(current_path).to eq(camp_lodges_path(@dobbins))
    end

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
end