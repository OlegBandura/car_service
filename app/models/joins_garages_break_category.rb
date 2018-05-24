# module JoinsGaragesBreakCategory
class JoinsGaragesBreakCategory < ApplicationRecord
  belongs_to :garage
  belongs_to :break_category

  # scope :select_added_category, -> (id) { joins(
  #   :garage, :break_category).select(
  #     'garages.garage_name, break_categories.break_category_name,
  #     joins_garages_break_categories.break_category_id').where(
  #     'joins_garages_break_categories.garage_id = ?', id
  #   ) }
end
