require 'rails_helper'

RSpec.describe "Camp index" do 
  it 'sees name of each parent record in system' do 
    dobbins = Camp.create!(name: 'Camp Cris Dobbins', campground_number: 13, vacancy?: true)
    visit "/camps" 
    expect(page).to have_content(dobbins.name)
  end
end