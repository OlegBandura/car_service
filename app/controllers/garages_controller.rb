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

    @cats = Hash.new { |hsh, key| hsh[key] = [] }
    @sub_cats = Hash.new { |v, k| v[k] = [] }

    break_categories.each do |cat|
      break_sub_category = BreakCategory.get_category_properties(cat.break_category_id)

      break_sub_category.each do |s_cat|
        # @sub_cats[s_cat[:id]].push(s_cat.break_sub_category_name)
        @sub_cats[s_cat[:break_sub_category_name]].push(s_cat)

      end

      # cc['catId'] = cat[:break_category_id]
      # cc['catName'] = cat[:break_category_name]
      # @cats[cat[:break_category_id]].push(cat[:break_category_id], cat[:break_category_name],  @sub_cats)


      @cats[cat[:break_category_name]].push(@sub_cats)
      # @cats[cat.break_category_id].push("catId" => cat.break_category_id, "catName" => cat.break_category_name, "subCat" => @sub_cats)

    end



    puts '-' * 50
    puts @cats

    break_categories.each do |b|
      @category_id = b.break_category_id
      @categories.push(b.break_category_name)

    # @break_sub_category = BreakCategory.get_category_properties(@category_id)

    # @break_sub_category.each do |c|
    #   @s_categories.push(c)
    # end
  end
    @comment = GarageComment.comment(@garage.id)
  end
end
