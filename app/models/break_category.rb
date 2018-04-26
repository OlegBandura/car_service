class BreakCategory < ApplicationRecord
  has_many :break_sub_categories, dependent: :destroy
  belongs_to :garage

  scope :break_sub_category, -> { joins(:break_sub_categories).select(
        'break_categories.name, break_sub_categories.break_sub_category_name,
        break_sub_categories.id') }
end
