# profile controller
class ProfileController < ApplicationController
  def index
    @user_id = current_user.id
    @user_car = UserCar.joins(:car_model, :brand).select(
      'car_models.model, user_cars.car_year, brands.brand_name'
    ).where('user_id = ? and brands.id = user_cars.brand_id', @user_id)



    @year = Array[]
    Time.current.year.downto(1970) { |n| @year.push(n) }

  end

  def create
    user_car = UserCar.new(profile_params)
    user_car.save
  end

  private

  def profile_params
    params.require(:profile).permit(:brand_id, :car_model_id, :car_year).merge(
      user_id: current_user.id
    )
  end
end
