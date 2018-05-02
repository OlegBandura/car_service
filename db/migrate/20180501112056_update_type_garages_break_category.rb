class UpdateTypeGaragesBreakCategory < ActiveRecord::Migration[5.1]
  def change
    remove_column :garage_break_caregories, :break_categories_id
    add_column :garage_break_caregories, :break_categories_ids, :integer, array: true, default: []
  end
end
