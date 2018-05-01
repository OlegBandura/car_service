module Admin
  # GaragesController
  class GaragesController < BaseController
    def index
      @garages = Garage.get_user
    end

    def new
      @user = User.role
    end

    def create
      # render plain: garage_params
      Garage.create(garage_params)
      redirect_to admin_garages_path
    end

    def edit
      @garage = Garage.find(params[:id])
      @user = User.role
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
        :garage_email, :image_url, :remote_image_url, :remove_image,
        work_shedule: [], garage_types: []
      )
    end
  end
end
