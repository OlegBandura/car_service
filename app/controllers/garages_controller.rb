# garages controller
class GaragesController < ApplicationController
  def show
    @garage = Garage.find(params[:id])
    @director = User.find(@garage.user_id)

    # @categories = Hash.new { |hsh, key| hsh[key] = [] }
    @s_categories = []
    @categories = []
     break_categories = JoinsGaragesBreakCategory.select_added_category(@garage.id)

    break_categories.each do |b|
      @category_id = b.break_category_id
      @categories.push(b.break_category_name)




    @break_sub_category = BreakCategory.joins(:break_sub_categories).select(
    'break_sub_categories.break_sub_category_name, break_sub_categories.id,
    break_categories.break_category_name,
    break_sub_categories.break_category_id').where(
    'break_sub_categories.break_category_id = ?', @category_id
    )

    @break_sub_category.each do |c|
      @s_categories.push(c)
    end
  end
    @comment = GarageComment.comment(@garage.id)
  end
end
