class BreakCategory < ApplicationRecord
  has_many :break_sub_categories, dependent: :destroy
end
