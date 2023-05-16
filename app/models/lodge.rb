class Lodge < ApplicationRecord
  belongs_to :camp

  def self.true_records 
    lodges = Lodge.all
    lodges.find_all do |lodge|
      lodge.specialty_area == true
    end
  end

  def self.alphabetical
    Lodge.order(name: :asc)
  end
end