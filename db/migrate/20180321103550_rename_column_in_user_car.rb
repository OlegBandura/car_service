# rename & add new column in Car_User table
class RenameColumnInUserCar < ActiveRecord::Migration[5.1]
  def change
    add_column :user_cars, :brand_id, :integer
    rename_column :user_cars, :car_model_id, :model_id
  end
end
