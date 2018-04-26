# CarWashesController
class CarWashesController < ApplicationController
  def index
    @car_washes = Garage.car_wash_property
  end

  def show
    @garage = Garage.find(params[:id])
  end
end
