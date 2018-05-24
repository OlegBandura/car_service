# garages controller
class GaragesController < ApplicationController
  def show
    @garage = Garage.find(params[:id])
    @director = User.find(@garage.user_id)
    break_categories = BreakCategory.select_added_category(
      @garage.id
    )
    @categories = Hash.new { |hsh, key| hsh[key] = [] }
    break_categories.each do |c|
      @categories[c[:break_category_name]].push(c)
    end

    @comment = GarageComment.comment(@garage.id)
  end
end
