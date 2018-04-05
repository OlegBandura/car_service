# garages controller
class GaragesController < ApplicationController
  def show
    @garage = Garage.find(params[:id])
    @user = User.joins(:garage_comments).select('name, surname').where(
      'users.id = garage_comments.user_id and garage_id = ?', @garage.id
    )

    @break_categoties = BreakCategory.joins(:break_sub_categories, :garage)
    .select(
      'garages.garage_name, break_categories.name,
      break_sub_categories.break_sub_category_name '
      )
      .where(
      'break_categories.garage_id = ? and
      break_sub_categories.break_category_id = break_categories.id', @garage.id
    )

    puts '________________'
    @break_categoties.each do |break_category|
      puts "#{break_category.garage_name}  #{break_category.name}  #{break_category.break_sub_category_name}"

    end
  end
end
