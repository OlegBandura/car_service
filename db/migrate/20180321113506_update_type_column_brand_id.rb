class UpdateTypeColumnBrandId < ActiveRecord::Migration[5.1]
  def change
    remove_column :user_cars, :brand_id
    add_column :user_cars, :brand_id, :bigint
  end
end
