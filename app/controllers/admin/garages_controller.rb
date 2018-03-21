module Admin
  # GaragesController
  class GaragesController < BaseController
    def index
      @garages = Garage.left_joins(:user).select(
        'users.surname, users.name, garages.garage_name, garages.description,
        garages.city, garages.address, garages.phone, garages.diler,
        garages.image, garages.garage_rating, garages.garage_types,
        garages.work_shedule, garages.id'
      )
    end

    def new
      @user = User.where("'owner' = ANY (roles)")
    end

    def create
      Garage.create(garage_params)
      redirect_to admin_garages_path
    end

    def edit
      @garage = Garage.find(params[:id])
      @user = User.where("'owner' = ANY (roles)")
    end

    def update
      garage = Garage.find(params[:id])
      if garage.update(garage_params)
        redirect_to admin_garages_path
      else
        render action: 'edit'
      end
    end

    def destroy
      garage = Garage.find(params[:id])
      garage.destroy
      redirect_to admin_garages_path
    end

    private

    def garage_params
      params.require(:garage).permit(
        :user_id, :garage_name, :city, :address, :description, :phone, :diler,
        :image_url, :remote_image_url, :remove_image, work_shedule: [], garage_types: []
      )
    end
  end
end
