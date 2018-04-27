# garages controller
class GaragesController < ApplicationController
  def show
    @garage = Garage.find(params[:id])
    @director = User.find(@garage.user_id)

    # @break_categories = BreakCategory.break_sub_category.select('break_categories.name').where(
    #   'break_sub_categories.break_category_id = break_categories.id and
    #   break_categories.garage_id = ?', @garage.id)

    # @arr = []
    # @break_categories.each do |break_category|
    #   @arr.push(break_category.name)
    #   @arr = @arr.uniq
    # end

    @comment = GarageComment.comment.where('users.id = garage_comments.user_id and
      garage_id = ?', @garage.id)
  end
end
