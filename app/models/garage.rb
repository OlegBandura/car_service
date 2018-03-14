# garage model
class Garage < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user

  # extend Enumerize
  #
  # serialize :garage_types, Array
  # enumerize :garage_types, in: %i[service vulcanization car_wash], multiple: true
end
