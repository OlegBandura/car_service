# garages controller
class GaragesController < ApplicationController
  def show
    @garage = Garage.find(params[:id])
  end
end
