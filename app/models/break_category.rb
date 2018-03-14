class BreakCategory < ApplicationRecord
  has_many :break_sub_categories, dependent: :destroy
  belongs_to :garage
end
