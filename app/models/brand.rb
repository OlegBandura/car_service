#brand model
class Brand < ApplicationRecord
  has_many :car_models, dependent: :destroy

  scope :get_car, -> { left_joins(:car_models).select(
    'car_models.id, car_models.brand_id,
    brands.brand_name, car_models.model') }
end
