class RemanePriceType < ActiveRecord::Migration[5.1]
  def change
    remove_column :break_sub_categories, :price
    add_column :break_sub_categories, :price, :integer
  end
end
