class LodgesController <ApplicationController
  def index
    @lodges = Lodge.all
  end

  def show
    @lodge = Lodge.find(params[:id])
  end
end