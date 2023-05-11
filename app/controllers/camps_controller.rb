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
  end
end