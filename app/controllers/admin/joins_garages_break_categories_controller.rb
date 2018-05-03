module Admin
  # garage break category
  class JoinsGaragesBreakCategoriesController < BaseController

    def create
      @garage = Garage.find(params[:garage_id])

      break_category_params[:break_category_ids].each do |bc|
          @garage_break_categories = JoinsGaragesBreakCategory.create(
          garage_id: break_category_params[:garage_id], break_category_id: bc)
      end

      redirect_to admin_garages_path
    end

    private

    def break_category_params
      params.require(:garage_break_categories).permit(break_category_ids: []).merge(
        garage_id: @garage.id
      )
    end
  end
end
