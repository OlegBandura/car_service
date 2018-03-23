# ServicesController
class ServicesController < ApplicationController
  def index
    @services = Garage.where('garage_types @> ARRAY[?]::varchar[]', ['service'])
  end
  # def show
  #   @garage = Garage.find(params[:id])
  # end
end
