# garages controller
class GaragesController < ApplicationController
  def show
    @garage = Garage.find(params[:id])
    @director = User.find(@garage.user_id)

    @s_categories = []
    @categories = []
    break_categories = JoinsGaragesBreakCategory.select_added_category(
      @garage.id
    )

    break_categories.each do |b|
      @category_id = b.break_category_id
      @categories.push(b.break_category_name)

    @break_sub_category = BreakCategory.get_category_properties(@category_id)

    @break_sub_category.each do |c|
      @s_categories.push(c)
    end
  end
    @comment = GarageComment.comment(@garage.id)
  end
end
