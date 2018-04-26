# orders controller
class OrdersController < ApplicationController
  def index; end

  def new
    @garage = Garage.find(params[:garage_id])
    @user_id = current_user.id
    @user_car = UserCar.user_car_property.where(
      'user_id = ? and brands.id = user_cars.brand_id', @user_id)
    @year = Array[]
    Time.current.year.downto(1980) { |n| @year.push(n) }
  end

  def create
    user_car = UserCar.new(car_params)
    user_car.save
    redirect_to new_garage_order_url

    # date = Date.civil(params[:date][:year].to_i, params[:date][:month].to_i, params[:date][:day].to_i)
    # time = params[:time].parse_time_select! :time
    # puts '______________________'
    # puts date
    # puts time
    #
    # @date = "#{date}  at "
    # @user = current_user
    # @garage = Garage.find(params[:garage_id])
    # @destroy = 'engine'
    # @car = "Honda"
    #
    # @info = order_params
    #
    # ClientMailer.send_order(@user, @garage, @destroy, @car, @info, @date).deliver
    # redirect_to new_garage_order_url
  end

  private

  def order_params
    params.require(:order).permit(:user_car_id, :garage_id,
      :break_sub_category_id, :description, :status, :times, :phone)
  end

  def car_params
    params.require(:car).permit(:brand_id, :car_model_id, :car_year).merge(
      user_id: current_user.id
    )
  end
end
