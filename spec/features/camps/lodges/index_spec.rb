require 'rails_helper' 

RSpec.describe 'Camps lodges index' do 
  it '/camps/:camp_id/lodges shows all lodges w/attributes for a camp' do 
    dobbins = Camp.create!(name: 'Camp Cris Dobbins', campground_number: 13, vacancy: true)
    scout_craft = dobbins.lodges.create!(name: 'Scout Craft', director: 'Lauren Dewey', number_of_staff: 4, specialty_area: false)
    silver_lake = dobbins.lodges.create!(name: 'Silver Lake', director: 'Jake Burr', number_of_staff: 6, specialty_area: true)

    visit "/camps/#{dobbins.id}/lodges"
    expect(page).to have_content("#{dobbins.name} Lodges")
    expect(page).to have_content("#{scout_craft.name}")
    expect(page).to have_content("Director: #{scout_craft.director}")
    expect(page).to have_content("Number of Staff: #{scout_craft.number_of_staff}")
    expect(page).to have_content("Specialty Area: #{scout_craft.specialty_area}")
    expect(page).to have_content("#{silver_lake.name}")
    expect(page).to have_content("Director: #{silver_lake.director}")
    expect(page).to have_content("Number of Staff: #{silver_lake.number_of_staff}")
    expect(page).to have_content("Specialty Area: #{silver_lake.specialty_area}")
  #partials lesson 
  #gives ability to reuse identical bits of code 

  end
end
