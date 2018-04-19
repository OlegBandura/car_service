# orders controller
class OrdersController < ApplicationController
  def index; end

  def new
    @garage = Garage.find(params[:garage_id])
    @user_id = current_user.id
    @user_car = UserCar.joins(:car_model, :brand).select(
      'car_models.model, user_cars.car_year, brands.brand_name, user_cars.id,
       brands.id, user_cars.brand_id, user_cars.car_model_id'
    ).where('user_id = ? and brands.id = user_cars.brand_id', @user_id)
    @year = Array[]
    Time.current.year.downto(1980) { |n| @year.push(n) }
  end

  def create
    # user_car = UserCar.new(car_params)
    # user_car.save
    redirect_to new_garage_order_url

    @user = current_user
    @garage = Garage.find(params[:garage_id])
    @destroy = 'engine'
    @car = "Honda"

    @info = order_params

    redirect_to new_garage_order_url
    ClientMailer.send_order(@user, @garage, @destroy, @car, @info).deliver
  end

  private

  # def car_params
  #   params.require(:car).permit(:brand_id, :car_model_id, :car_year).merge(
  #     user_id: current_user.id
  #   )
  # end

  def order_params
    params.require(:order).permit(:user_car_id, :garage_id,
      :break_sub_category_id, :description, :status, :times, :phone)
  end
end
