class Camp < ApplicationRecord
  has_many :lodges

  def sort_alphabetically(sort)
    if sort == 'yeahbaby'
      lodges.order(name: :asc)
    else
      lodges
    end
  end
end