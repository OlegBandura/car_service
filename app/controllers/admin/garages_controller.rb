class Admin::GaragesController < Admin::BaseController
  def index
    @garages = Garage.left_joins(:user).select('users.surname, users.name, garages.garage_name, garages.description,
      garages.city, garages.address, garages.phone, garages.diler, garages.image, garages.garage_rating,
      garages.garage_types, garages.work_shedule')
  end

  def new

  end
  def create
    render plain: garage_p

  end

  private

  def garage_p
    params.require(:garage).permit(:user_id, :garage_name, :city, :address, :description,
      :phone, :diler, :image_url, :workday, :saturday, :sunday)
  end
end
