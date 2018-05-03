module Admin
  # garage break category
  class GarageBreakCategoriesController < BaseController

    def create
      @garage = Garage.find(params[:garage_id])
      # @garage.update_attributes(break_category_params)
      @garage_break_categories = GarageBreakCategory.create(break_category_params)
      # @garage_destroys = GarageBreakCategory.create(break_category_params)
      render plain: @garage.id
    end

    private

    def break_category_params
      params.require(:garage_break_categories).permit(:break_category_ids)
    end
  end
end
