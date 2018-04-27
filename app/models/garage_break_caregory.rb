class GarageBreakCaregory < ApplicationRecord
  has_many :garages
  has_many :break_categories
end
