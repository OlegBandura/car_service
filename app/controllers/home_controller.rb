# home controller
class HomeController < ApplicationController
  def index
    @garages = Garage.all
    @types_count = Garage.garage_type.options
  end
end
