# rename column car_model_id
class UpdateNameColumnUserCar < ActiveRecord::Migration[5.1]
  def change
    rename_column :user_cars, :model_id, :car_model_id
  end
end
