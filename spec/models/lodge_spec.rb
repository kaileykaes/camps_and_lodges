require 'rails_helper'

RSpec.describe Lodge, type: :model do 
  it { should belong_to :camp }
end