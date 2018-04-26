# home controller
class HomeController < ApplicationController
  def index
    @garage_types = Garage.garage_type.options

    @garages = Garage.count_property.count
    puts "____________"
    puts @garages
  end
end
