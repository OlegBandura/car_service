class AddArrayToGarageBreakCategory < ActiveRecord::Migration[5.1]
  def change
    remove_column :garage_break_categories, :break_category_id
    add_column :garage_break_categories, :break_categories_ids, :integer, array: true, default: []
  end
end
