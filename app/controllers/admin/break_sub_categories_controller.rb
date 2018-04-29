module Admin
  # break sub category
  class BreakSubCategoriesController < BaseController
    def new
      @break_category = BreakCategory.all
    end

    def create
      @break_category = BreakCategory.find(category_params[:break_category_id])
      @break_category.break_sub_categories.create(break_sub_category_params)
      redirect_to admin_break_categories_path
    end

    def edit
      @sub_category = BreakSubCategory.find(params[:id])
    end

    def update
      @sub_category = BreakSubCategory.find(params[:id])
      if @sub_category.update(break_sub_category_params)
        redirect_to admin_break_categories_path
      else
        render action 'edit'
      end
    end

    def destroy
      sub_category = BreakSubCategory.find(params[:id])
      sub_category.destroy
      redirect_to admin_break_categories_path
    end

    private

    def category_params
      params.require(:sub_category).permit(:break_category_id)
    end

    def break_sub_category_params
      params.require(:break_sub_category).permit(:break_sub_category_name, :price)
    end
  end
end
