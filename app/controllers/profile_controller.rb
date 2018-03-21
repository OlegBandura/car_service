# profile controller
class ProfileController < ApplicationController
  def index
    @user_id = current_user.id
    @user_car = UserCar.joins(:car_model, :brand).select(
      'car_models.model, user_cars.car_year, brands.brand_name, user_cars.id'
    ).where('user_id = ? and brands.id = user_cars.brand_id', @user_id)
    @year = Array[]
    Time.current.year.downto(1970) { |n| @year.push(n) }
  end

  def create
    user_car = UserCar.new(profile_params)
    user_car.save
    redirect_to profile_index_path
  end

  def destroy
    user_car = UserCar.find(params[:id])
    user_car.destroy
    redirect_to profile_index_path
  end

  private

  def profile_params
    params.require(:profile).permit(:brand_id, :car_model_id, :car_year).merge(
      user_id: current_user.id
    )
  end
end
