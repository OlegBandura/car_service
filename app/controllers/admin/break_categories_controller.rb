class Admin::BreakCategoriesController < Admin::BaseController

  def index
    categories = BreakCategory.left_joins(:break_sub_categories).select('break_categories.name,
       break_categories.garage_id, break_sub_categories.name, break_sub_categories.price')

       categories.each do |car|
         puts "_______________"
         puts categories[car[:name]]
       end

  end
end
