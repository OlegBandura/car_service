class Admin::GaragesController < Admin::BaseController
  def index
    @garages = Garage.left_joins(:user).select('users.surname, users.name, garages.garage_name, garages.description,
      garages.city, garages.address, garages.phone, garages.diler, garages.image_url, garages.garage_rating,
      garages.garage_types, garages.work_shedule')
  end

  def create

  end

  protected

  def garage_params
    params.require(:garage).permit(:user_id, :name, :city, :address, :description, :phone, :diler, :image_url, :service, :vulcanization, :car_wash , :workday, :saturday, :sunday)
  end
end
