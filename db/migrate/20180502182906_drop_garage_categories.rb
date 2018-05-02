class DropGarageCategories < ActiveRecord::Migration[5.1]
  def change
    drop_table :garage_break_caregories
  end
end
