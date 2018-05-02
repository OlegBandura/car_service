# garage break category
class GarageBreakCategory < ApplicationRecord
  belongs_to :garages
  belongs_to :break_categories

end
