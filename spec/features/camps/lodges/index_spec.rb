require 'rails_helper' 

RSpec.describe 'Camps lodges index' do 
  before(:each) do 
    @dobbins = Camp.create!(name: 'Camp Cris Dobbins', campground_number: 13, vacancy: true)
    @scout_craft = @dobbins.lodges.create!(name: 'Scout Craft', director: 'Lauren Dewey', number_of_staff: 4, specialty_area: false)
    @silver_lake = @dobbins.lodges.create!(name: 'Silver Lake', director: 'Jake Burr', number_of_staff: 6, specialty_area: true)
    @the_ool = @dobbins.lodges.create!(name: 'The Ool', director: 'Evan Dorrough', number_of_staff: 6, specialty_area: true)
  end

  it '/camps/:camp_id/lodges shows all lodges w/attributes for a camp' do 
    @dobbins = Camp.create!(name: 'Camp Cris Dobbins', campground_number: 13, vacancy: true)
    @silver_lake = @dobbins.lodges.create!(name: 'Silver Lake', director: 'Jake Burr', number_of_staff: 6, specialty_area: true)
    @scout_craft = @dobbins.lodges.create!(name: 'Scout Craft', director: 'Lauren Dewey', number_of_staff: 4, specialty_area: false)

    visit "/camps/#{@dobbins.id}/lodges"
    expect(page).to have_content("#{@dobbins.name} Lodges")
    expect(page).to have_content("#{@scout_craft.name}")
    expect(page).to have_content("Director: #{@scout_craft.director}")
    expect(page).to have_content("Number of Staff: #{@scout_craft.number_of_staff}")
    expect(page).to have_content("Specialty Area: #{@scout_craft.specialty_area}")
    expect(page).to have_content("#{@silver_lake.name}")
    expect(page).to have_content("Director: #{@silver_lake.director}")
    expect(page).to have_content("Number of Staff: #{@silver_lake.number_of_staff}")
    expect(page).to have_content("Specialty Area: #{@silver_lake.specialty_area}")
  #partials lesson 
  #gives ability to reuse identical bits of code 
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

  describe 'sorting alphabetically active record' do 
    it 'sort parents children in alphabetical order by name' do 
      adventure = @dobbins.lodges.create!(name: 'Adventure Lodge', director: 'Jacob Mann', number_of_staff: 4, specialty_area: false)
      visit "/camps/#{@dobbins.id}/lodges"
      expect(page).to have_link('Sort Lodges Alphabetically')
      click_on 'Sort Lodges Alphabetically'
      expect(adventure.name).to appear_before(@scout_craft.name)
      expect(@scout_craft.name).to appear_before(@silver_lake.name)
      expect(@silver_lake.name).to appear_before(@the_ool.name)
      expect(@silver_lake.name).to_not appear_before(@scout_craft.name)
    end
  end
end
