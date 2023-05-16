require 'rails_helper'

RSpec.describe Lodge, type: :model do 
  before :each do 
    @magness = Camp.create!(name: 'Magness Adventure Camp', campground_number: 4, vacancy: true)
    @magness_lake = @magness.lodges.create!(name: 'Lake Area', director: 'Ian Hendrick', number_of_staff: 4, specialty_area: true)
    @rock_range = @magness.lodges.create!(name: 'Rock Throwing Range', director: 'Chais Maranto', number_of_staff: 2, specialty_area: true)
    @nature_lodge = @magness.lodges.create!(name: 'Nature Area', director: 'Stevo', number_of_staff: 3, specialty_area: false)
  end

  describe 'relationship' do 
    it { should belong_to :camp}
  end

  describe 'class methods' do
    it 'sorts truthy records' do 
      expect(Lodge.true_records).to eq([@magness_lake, @rock_range])
    end
  end
end