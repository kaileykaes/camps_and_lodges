class CampsController < ApplicationController
  def index
    @camps = Camp.order('created_at DESC')
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

  def new
    @new_camp = Camp.new
  end

  def create
    new_camp = Camp.create!(name: params[:camp][:name], campground_number: params[:camp][:campground_number], vacancy: params[:camp][:vacancy])
    redirect_to '/camps'
  end
end