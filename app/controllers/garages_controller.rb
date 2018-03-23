# garages controller
class GaragesController < ApplicationController
  def show
    @garage = Garage.find(params[:id])

    @garage.garage_comments.each do |comment|
      @user = comment.user_id
      puts '____________________________'
      puts @user
    end
    @garage = Garage.find(params[:id])
  end
end
