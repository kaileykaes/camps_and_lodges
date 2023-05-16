require 'rails_helper'

RSpec.describe Camp, type: :model do
  before :each do 
    @magness = Camp.create!(name: 'Magness Adventure Camp', campground_number: 4, vacancy: true)
    @magness_lake = @magness.lodges.create!(name: 'Lake Area', director: 'Ian Hendrick', number_of_staff: 4, specialty_area: true)
    @rock_range = @magness.lodges.create!(name: 'Rock Throwing Range', director: 'Chais Maranto', number_of_staff: 2, specialty_area: true)
    @nature_lodge = @magness.lodges.create!(name: 'Nature Area', director: 'Stevo', number_of_staff: 3, specialty_area: false)
  end

  it { should have_many :lodges }
    
  xit 'sort alphabetically' do 
    expect(@magness.lodges.sort_alphabetically('yeahbaby')).to eq([@magness_lake, @nature_lodge, @rock_range])
    expect(@magness.lodges.sort_alphabetically('nobaby')).to_not eq([@magness_lake, @nature_lodge, @rock_range])
  end
end