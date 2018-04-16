# garages controller
class GaragesController < ApplicationController
  def show
    @garage = Garage.find(params[:id])
    @user = User.joins(:garage_comments).select('name, surname').where(
      'users.id = garage_comments.user_id and garage_id = ?', @garage.id
    )

    @break_categories = BreakCategory.joins(:break_sub_categories).select(
      'break_categories.name, break_sub_categories.break_sub_category_name, break_sub_categories.id'
    ).where('break_categories.garage_id = ? and
      break_sub_categories.break_category_id = break_categories.id', @garage.id)

    @break_categories.each do |break_category|
      puts "#{break_category.name}  #{break_category.break_sub_category_name}"
    end

  end
end
