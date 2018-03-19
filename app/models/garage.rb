# garage model
class Garage < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user

  extend Enumerize

  serialize :garage_types, Array
  enumerize :garage_types, in:
  {
    'Майстерня' => ':service', 'Шиномонтаж' => ':vulcanization',
    'Автомийка' => ':car_wash'
  }, multiple: true
end
