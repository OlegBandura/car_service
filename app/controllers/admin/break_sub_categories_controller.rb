class Admin::BreakSubCategoriesController < Admin::BaseController
  def new
    @break_category = BreakCategory.all
  end

  def create
    @brand = Brand.find(brand_p[:brand_id])
    @brand.car_models.create(car_params)
    render plain: car_params.inspect
    redirect_to admin_brands_path
  end

  private

  def brand_p
    params.require(:break_sub_category).permit(:brand_id)
  end

  def car_params
    params.require(:break_sub_category).permit(:model)
  end

end
