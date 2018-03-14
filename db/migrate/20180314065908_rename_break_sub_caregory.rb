class RenameBreakSubCaregory < ActiveRecord::Migration[5.1]
  def change
    rename_column :break_sub_categories, :category_id, :break_category_id
  end
end
