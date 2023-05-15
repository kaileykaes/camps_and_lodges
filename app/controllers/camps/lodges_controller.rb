class Camps::LodgesController < ApplicationController
  def index
    @camp = Camp.find(params[:id])
    @lodges = @camp.lodges.all
    #alternative solution could be to create another controller 
    #both of these are valid
  end
  
  def new
    @camp = Camp.find(params[:id])
  end

  def create
    @camp = Camp.find(params[:id])
    new_lodge = @camp.lodges.create!(lodge_params)
    redirect_to "/camps/#{@camp.id}/lodges"
  end

  private
  def lodge_params
    params.permit(:name, :director, :number_of_staff, :specialty_area)
  end
end