# garage model
class Garage < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user

  extend Enumerize

  serialize :garage_type, Array
  enumerize :garage_type, in:
  {
    'Майстерня' => ':service', 'Шиномонтаж' => ':vulcanization',
    'Автомийка' => ':car_wash'
  }
end
