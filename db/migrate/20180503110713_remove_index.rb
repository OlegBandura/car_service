class RemoveIndex < ActiveRecord::Migration[5.1]
  def change
    remove_index :joins_garages_break_categories, :garage_id
    remove_index :joins_garages_break_categories, :break_category_id
  end
end
