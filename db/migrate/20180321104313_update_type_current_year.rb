# update type column
class UpdateTypeCurrentYear < ActiveRecord::Migration[5.1]
  def change
    remove_column :user_cars, :car_year
    add_column :user_cars, :car_year, :integer
  end
end
