# garage model
class Garage < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :garage_comments

  has_many :break_categories

  extend Enumerize

  serialize :garage_type, Array
  enumerize :garage_type, in: %i[service vulcanization car_wash]


  scope :tire_stations_property, -> { where('garage_types @> ARRAY[?]::varchar[]', ['vulcanization']) }
  scope :service_property, -> { where('garage_types @> ARRAY[?]::varchar[]', ['service']) }
  scope :car_wash_property, -> { where('garage_types @> ARRAY[?]::varchar[]', ['service']) }

end
