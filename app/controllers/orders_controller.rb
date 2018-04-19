# orders controller
class OrdersController < ApplicationController
  def index; end

  def new
    @user_id = current_user.id
    @user_car = UserCar.joins(:car_model, :brand).select(
      'car_models.model, user_cars.car_year, brands.brand_name, user_cars.id,
       brands.id, user_cars.brand_id, user_cars.car_model_id'
    ).where('user_id = ? and brands.id = user_cars.brand_id', @user_id)
    @year = Array[]
    Time.current.year.downto(1980) { |n| @year.push(n) }
  end

  def create
    user_car = UserCar.new(order_params)
    user_car.save
    redirect_to new_garage_order_url

    # @user = User.find(3)
    # @car = order_params
    # puts'_____________'
    # puts @car
    #
    # redirect_to orders_path
    # ClientMailer.send_order(@user, @car).deliver
  end

  private

  def order_params
    params.require(:order).permit(:brand_id, :car_model_id, :car_year).merge(
      user_id: current_user.id
    )
  end
end
