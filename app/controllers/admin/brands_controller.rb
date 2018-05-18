module Admin
  class BrandsController < BaseController
    # load_and_authorize_resource
    def index
      cars = Brand.get_car

      @cars = Hash.new { |hsh, key| hsh[key] = [] }
      cars.each do |car|
        @cars[car[:brand_name]].push(car)
      end
    end

    def create
      @brand = Brand.create(brand_params)
      redirect_to admin_brands_path
    end

    def edit
      @brand = Brand.find(params[:id])
    end

    def update
      @brand = Brand.find(params[:id])
      if @brand.update(brand_params)
        redirect_to admin_brands_path
      else
        render action 'edit'
      end
    end

    def destroy
      brand = Brand.find(params[:id])
      brand.destroy
      redirect_to admin_brands_path
    end

    private

    def brand_params
      params.require(:brand).permit(:brand_name)
    end
  end
end
