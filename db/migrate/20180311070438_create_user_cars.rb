class CreateUserCars < ActiveRecord::Migration[5.1]
  def change
    create_table :user_cars do |t|
      t.references :car_model, index: true
      t.references :user, index: true
      t.date :car_year

      t.timestamps
    end
  end
end
