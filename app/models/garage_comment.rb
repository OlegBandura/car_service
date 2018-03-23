# garage comment model
class GarageComment < ApplicationRecord
  belongs_to :garage
  belongs_to :user
end
