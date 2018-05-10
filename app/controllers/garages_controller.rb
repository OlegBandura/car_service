# garages controller
class GaragesController < ApplicationController
  def show
    @garage = Garage.find(params[:id])
    @director = User.find(@garage.user_id)

    @break_categories = JoinsGaragesBreakCategory.select_added_category(
      @garage.id
    )

    @break_categories.each do |b|
      puts'______________________'
      puts b.break_category_id
      @break_sub_category = BreakSubCategory.get_break_category(
        b.break_category_id
      )
      puts @break_sub_category
      @break_sub_category.each do |bsc|
        puts '__________________________'
        @bsc = bsc.break_sub_category_name
      end
    end
    @comment = GarageComment.comment(@garage.id)
  end
end
