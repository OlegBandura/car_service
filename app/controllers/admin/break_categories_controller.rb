class Admin::BreakCategoriesController < Admin::BaseController

  def index
    categories = BreakCategory.left_joins(:break_sub_categories, :garage).select("break_categories.name,
       break_sub_categories.break_sub_category_name, break_sub_categories.price")

          # @categories.each do |c|
          #   puts "_______________"
          #   puts c.name, c.garage_id, c.break_sub_category_name
          # end

    @categories = Hash.new { |hsh, key| hsh[key] = [] }
      categories.each do |c|
      @categories[c[:name]].push(c)
      puts "__________"
      puts @categories
    end

  end
end
