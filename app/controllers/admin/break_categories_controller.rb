class Admin::BreakCategoriesController < Admin::BaseController

  def index
    categories = BreakCategory.left_joins(:break_sub_categories).select("break_categories.name,
       break_sub_categories.break_sub_category_name, break_sub_categories.price")
    @categories = Hash.new { |hsh, key| hsh[key] = [] }
      categories.each do |c|
      @categories[c[:name]].push(c)
      puts "__________"
      puts @categories
    end
  end

  def create
    BreakCategory.create(brake_category_params)
    redirect_to admin_break_categories_path
  end

  private

  def brake_category_params
    params.require(:break_category).permit(:name)
  end
end
