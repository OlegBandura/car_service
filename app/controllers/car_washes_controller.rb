# CarWashesController
class CarWashesController < ApplicationController
  def index
    @car_washes = Garage.where(
      'garage_types @> ARRAY[?]::varchar[]', ['car_wash']
    )
  end

  def show
    @garage = Garage.find(params[:id])
  end
end
