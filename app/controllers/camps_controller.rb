class CampsController < ApplicationController
  def index
    @camps = Camp.order('created_at DESC')
    #put active record method in model and create new method for separated testing purposes
  end

  def show 
    @camp = Camp.find(params[:id])
  end

 

  def new
    @new_camp = Camp.new
  end

  def create
    new_camp = Camp.create!(name: params[:camp][:name], campground_number: params[:camp][:campground_number], vacancy: params[:camp][:vacancy])
    redirect_to '/camps'
  end

  def edit
    @camp = Camp.find(params[:id])
  end

  def update
    camp = Camp.find(params[:id])
    camp.update({
      name: params[:name], 
      campground_number: params[:campground_number],
      vacancy: params[:vacancy]
    })
    camp.save
    redirect_to "/camps/#{camp.id}"
  end
end