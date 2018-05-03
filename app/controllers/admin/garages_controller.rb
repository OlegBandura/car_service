module Admin
  # GaragesController
  class GaragesController < BaseController
    def index
      @garages = Garage.get_user

      # @break_categories = GarageBreakCategory.joins(:garage).select(
      #   'garages.garage_name'
      # ).where('garage_break_categories.garage_id = 7')
      #
      # @break_categories.each do |b|
      #   puts '_______________'
      #   puts b.garage_name
      # end
    end

    def show
      @garage = Garage.find(params[:id])
      @break_categories = BreakCategory.select_category
    end

    def new
      @user = User.role
      @break_categories = BreakCategory.select_category
    end

    def create
      # render plain: break_category_params
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
