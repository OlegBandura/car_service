# garages controller
class GaragesController < ApplicationController
  def show
    @garage = Garage.find(params[:id])
    @user = User.joins(:garage_comments).select('name, surname').where(
      'users.id = garage_comments.user_id and garage_id = ?', @garage.id
    )
    @director = User.find(@garage.user_id)

    @break_categories = BreakCategory.joins(:break_sub_categories).select(
      'break_categories.name, break_sub_categories.break_sub_category_name,
      break_sub_categories.id'
    ).where('break_categories.garage_id = ? and
      break_sub_categories.break_category_id = break_categories.id', @garage.id)

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

    # @commentor = User.find(@garage.garage_comments.user_id)
    @garage.garage_comments.each do |comment|
      @commentor = User.find(comment.user_id)
      # puts '__________________'
      # puts "#{@commentor.name} #{@commentor.surname}"
    end

  end
end
