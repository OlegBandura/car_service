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
  scope :count_property, -> { where('garage_types @> ARRAY[?]::varchar[]', [@type]) }
  scope :get_user, -> { left_joins(:user).select(
    'users.surname, users.name, garages.garage_name, garages.description,
    garages.city, garages.address, garages.phone, garages.diler,
    garages.image, garages.garage_rating, garages.garage_types,
    garages.work_shedule, garages.id, garage_email') }
end
