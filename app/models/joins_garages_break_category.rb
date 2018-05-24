# module JoinsGaragesBreakCategory
class JoinsGaragesBreakCategory < ApplicationRecord
  belongs_to :garage
  belongs_to :break_category

end
