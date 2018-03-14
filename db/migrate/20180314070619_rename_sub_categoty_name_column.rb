class RenameSubCategotyNameColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :break_sub_categories, :name, :break_sub_category_name
    
  end
end
