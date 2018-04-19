# orders controller
class OrdersController < ApplicationController
  def index
    @user_id = current_user.id
    @user_car = UserCar.joins(:car_model, :brand).select(
      'car_models.model, user_cars.car_year, brands.brand_name, user_cars.id,
       brands.id, user_cars.brand_id, user_cars.car_model_id'
    ).where('user_id = ? and brands.id = user_cars.brand_id', @user_id)

    puts '__________________________'
    puts @user_car['brands.id'.to_i]
    @year = Array[]
    Time.current.year.downto(1980) { |n| @year.push(n) }
  end

  def new

  end

  def create
    @car = order_params
    puts '___________________'
    puts @car
    redirect_to orders_path
    ClientMailer.client_email(@car).deliver
  end

  private

  def order_params
    params.require(:order).permit(:brand_id, :car_model_id, :car_year).merge(
      user_id: current_user.id
    )
  end
end
