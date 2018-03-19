# profile controller
class ProfileController < ApplicationController
  def index
    @year = Array[]
    Time.current.year.downto(1970) { |n| @year.push(n) }
  end

  def create
    render plain: profile_params
  end

  private

  def profile_params
    params.require(:profile).permit(:brand_id, :model_id, :car_year)
  end

end
