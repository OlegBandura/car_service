module Admin
  # garage break category
  class GarageBreakCategoriesController < BaseController
    def create

    end

    private

    def break_category_params
      params.require(:garage_break_category).permit(:destroys)
    end
  end
end
