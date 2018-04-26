# TireStationsController
class TireStationsController < ApplicationController
  def index
    @tire_services = Garage.tire_stations_property
  end

  def show
    @garage = Garage.find(params[:id])
  end
end
