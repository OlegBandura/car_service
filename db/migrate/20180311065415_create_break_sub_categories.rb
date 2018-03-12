class CreateBreakSubCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :break_sub_categories do |t|
      t.references :category, index: true
      t.string :name
      t.float :price

      t.timestamps
    end
  end
end
