require 'rails_helper'

RSpec.describe Camp, type: :model do 
  it { should have_many :lodges }
end