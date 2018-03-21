class UserCar < ApplicationRecord
  belongs_to :brand
  belongs_to :car_model
end
