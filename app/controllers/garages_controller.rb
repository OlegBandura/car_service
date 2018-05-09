# garages controller
class GaragesController < ApplicationController
  def show
    @garage = Garage.find(params[:id])
    @director = User.find(@garage.user_id)

    @break_categories = JoinsGaragesBreakCategory.joins(
      :garage, :break_category
    ).select(
      'break_categories.break_category_name, joins_garages_break_categories.break_category_id'
    ).where(
      'joins_garages_break_categories.garage_id = ?', @garage.id
    )
    @break_categories.each do |b|
      puts'______________________'
      puts b.break_category_id
      @break_sub_category = BreakSubCategory.joins(:break_category).select(
        'break_sub_categories.break_sub_category_name').where(
          'break_sub_categories.break_category_id = ?', b.break_category_id)

      puts @break_sub_category
      @break_sub_category.each do |bsc|
        puts '__________________________'
        @bsc = bsc.break_sub_category_name
      end
    end

    # @arr = []
    # @break_categories.each do |break_category|
    #   @arr.push(break_category.name)
    #   @arr = @arr.uniq
    # end

    @comment = GarageComment.comment.where('users.id = garage_comments.user_id and
      garage_id = ?', @garage.id)
  end
end
