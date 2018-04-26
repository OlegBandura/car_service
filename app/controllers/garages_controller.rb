# garages controller
class GaragesController < ApplicationController
  def show
    @garage = Garage.find(params[:id])
    @user = User.commentor.comment_property, @garage.id
    @director = User.find(@garage.user_id)

    @break_categories = BreakCategory.break_sub_category.where(
      'break_sub_categories.break_category_id = break_categories.id and
      break_categories.garage_id = ?', @garage.id )

      # joins(:break_sub_categories).select(
      #   'break_categories.name, break_sub_categories.break_sub_category_name,
      #   break_sub_categories.id'
      # ).where('break_categories.garage_id = ? and
      #   break_sub_categories.break_category_id = break_categories.id'

    @arr = []
    @break_categories.each do |break_category|
      @arr.push(break_category.name)
      @arr = @arr.uniq
    end

    @break_sub_categories = BreakSubCategory.where('break_sub_categories.break_category_id = 2')
    @break_sub_categories.each do |c|
      # puts '__________________'
      # puts c.break_sub_category_name
    end
  end
end
