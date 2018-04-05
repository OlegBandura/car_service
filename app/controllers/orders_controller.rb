# orders controller
class OrdersController < ApplicationController
  def index
    @user_id = current_user.id
    @user_car = UserCar.joins(:car_model, :brand).select(
      'car_models.model, user_cars.car_year, brands.brand_name, user_cars.id'
    ).where('user_id = ? and brands.id = user_cars.brand_id', @user_id)
    @year = Array[]
    Time.current.year.downto(1970) { |n| @year.push(n) }
  end

  def create
    car = Array.new
    car.push(order_params)
    puts '___________________'
    car.each do |i|
      puts i
    end

    redirect_to orders_path
  end

  private

  def order_params
    params.require(:order).permit(:brand_id, :car_model_id, :car_year).merge(
      user_id: current_user.id
    )
  end
end
