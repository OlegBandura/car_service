class GarageCategory < ActiveRecord::Migration[5.1]
  def change
    remove_column :garage_break_categories, :break_categories_ids
    add_column :garage_break_categories, :break_category_ids, :integer, array: true, default: []
  end
end
