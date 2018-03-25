# garage comment model
class GarageComment < ApplicationRecord
  belongs_to :garage
  belongs_to :user

  # delegate :name, to: :user, prefix: true
end
