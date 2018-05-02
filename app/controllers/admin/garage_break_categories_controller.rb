module Admin
  # garage break category
  class GarageBreakCategoriesController < BaseController

    def index; end

    def new
      @break_categories = BreakCategory.select_category
    end

    def create
      # @garage_id = Garage.find(params[:id])
      # render plain: @garage_id
      render plain: :garage_break_category
      # @garage_break_category = GarageBreakCategory.create(break_category_params)
    end

    private

    def break_category_params
      params.require(:garage_break_category).permit(:garage_id, :break_category_id)
    end
  end
end
