# class UserCar
class UserCar < ApplicationRecord
  belongs_to :brand
  belongs_to :car_model

  scope :user_car_property, -> (user_id) {
    joins(:car_model, :brand).select(
      'car_models.model, user_cars.car_year, brands.brand_name, user_cars.id,
      user_cars.brand_id, user_cars.car_model_id'
    ).where('user_id = ? and brands.id = user_cars.brand_id', user_id)
  }

  scope :get_selected_user_car, -> (id) {
    joins(:car_model, :brand).select(
      'car_models.model, user_cars.car_year, brands.brand_name'
    ).where('user_cars.id = ?', id)
  }
end
