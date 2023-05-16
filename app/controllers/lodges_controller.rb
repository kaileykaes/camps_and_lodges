class LodgesController <ApplicationController
  def index
    @lodges = Lodge.all
    # @lodges = Lodge.true_records
  end

  def show
    @lodge = Lodge.find(params[:id])
  end
end