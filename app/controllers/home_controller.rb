# home controller
class HomeController < ApplicationController
  def index
    @garage_types = Garage.garage_type.options

    @garages = Garage.where('garage_types @> ARRAY[?]::varchar[]', [@type]).count
    puts "____________"
    puts @garages
  end
end
