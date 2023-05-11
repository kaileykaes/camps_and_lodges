class LodgesController <ApplicationController
  def index
    @lodges = Lodge.all
  end
end