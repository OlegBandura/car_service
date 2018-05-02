class RenameColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :garage_break_categories, :break_categories_ids_id
    remove_column :garage_break_categories, :integer_id
    remove_column :garage_break_categories, :created_at
    remove_column :garage_break_categories, :updated_at
    add_column :garage_break_categories, :break_category_id, :integer
  end
end
