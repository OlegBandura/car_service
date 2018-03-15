class Admin::BreakCategoriesController < Admin::BaseController

  def index
    categories = BreakCategory.left_joins(:break_sub_categories).select(
      "break_categories.name, break_sub_categories.break_sub_category_name,
      break_sub_categories.price, break_sub_categories.id,
      break_sub_categories.break_category_id"
    )
    @categories = Hash.new { |hsh, key| hsh[key] = [] }
    categories.each do |c|
      @categories[c[:name]].push(c)
    end
  end

  def create
    BreakCategory.create(brake_category_params)
    redirect_to admin_break_categories_path
  end

  def edit
    @break_category = BreakCategory.find(params[:id])
  end

  def update
    @break_sub_category = BreakCategory.find(params[:id])
    if @break_sub_category.update(brake_category_params)
      redirect_to admin_break_categories_path
    else
      render action 'edit'
    end
  end

  def destroy
    break_category = BreakCategory.find(params[:id])
    break_category.destroy
    redirect_to admin_break_categories_path
  end

  private

  def brake_category_params
    params.require(:break_category).permit(:name)
  end
end
