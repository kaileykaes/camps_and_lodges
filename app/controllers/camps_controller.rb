class CampsController < ApplicationController
  def index
    @camps = Camp.all
  end

  def show 
    @camp = Camp.find(params[:id])
  end

  def show_lodges
    show
    @lodges = @camp.lodges.all
    #alternative solution could be to create another controller 
    #both of these are valid
  end
end