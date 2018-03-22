# TireStationsController
class TireStationsController < ApplicationController
  def index
    @tire_services = Garage.where(
      'garage_types @> ARRAY[?]::varchar[]', ['vulcanization']
    )
  end

  def show
    @garage = Garage.find(params[:id])
  end
end
