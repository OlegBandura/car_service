class DeleteArrayType < ActiveRecord::Migration[5.1]
  def change
    remove_column :garage_break_caregories, :break_categories_ids
    add_column :garage_break_caregories, :break_categories_id, :integer
  end
end
