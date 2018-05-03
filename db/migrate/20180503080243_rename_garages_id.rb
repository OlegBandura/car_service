class RenameGaragesId < ActiveRecord::Migration[5.1]
  def change
    remove_column :garage_break_categories, :garages_id
    add_column :garage_break_categories, :garage_id, :integer
  end
end
