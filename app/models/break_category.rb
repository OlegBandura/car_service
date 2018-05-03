# breakCategory model
class BreakCategory < ApplicationRecord
  has_many :break_sub_categories, dependent: :destroy
  has_many :joins_garages_break_categories

  # scope :break_sub_category, -> { joins(:break_sub_categories).select(
  #       'break_categories.name, break_sub_categories.break_sub_category_name,
  #       break_sub_categories.id') }

  scope :select_category_sub_category, -> {
    left_joins(:break_sub_categories).select('break_categories.break_category_name,
    break_sub_categories.break_sub_category_name,
    break_sub_categories.price, break_sub_categories.id,
    break_sub_categories.break_category_id')
  }
  scope :select_category, -> { order(break_category_name: :asc) }

end
