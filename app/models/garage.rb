# garage model
class Garage < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user

  extend Enumerize

  enumerize :garage_types, in: %i[service vulcanization car_wash], default:
            :service, predicates: true
end
