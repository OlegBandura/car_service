class UserCar < ApplicationRecord
  belongs_to :brand
  belongs_to :car_model

  scope :user_car_property, -> { joins(:car_model, :brand).select(
    'car_models.model, user_cars.car_year, brands.brand_name, user_cars.id,
     brands.id, user_cars.brand_id, user_cars.car_model_id') }
end
