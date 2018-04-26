# ServicesController
class ServicesController < ApplicationController
  def index
    @services = Garage.service_property
  end
end
