# migration update_break_categories
class UpdateBreakCategories < ActiveRecord::Migration[5.1]
  def change
    remove_column :break_categories, :garage_id
    rename_column :break_categories, :name, :break_category_name
  end
end
