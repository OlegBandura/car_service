# garage model
class Garage < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user

  extend Enumerize

  serialize :garage_type, Array
  enumerize :garage_type, in: %i[service vulcanization car_wash]
end
