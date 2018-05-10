# BreakSubCategory model
class BreakSubCategory < ApplicationRecord
  belongs_to :break_category

scope :get_break_category, -> (break_category_id) {
  joins(:break_category).select(
    'break_sub_categories.break_sub_category_name').where(
      'break_sub_categories.break_category_id = ?', break_category_id) }
end
