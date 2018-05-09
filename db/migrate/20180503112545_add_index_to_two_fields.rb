# add index to two fields
class AddIndexToTwoFields < ActiveRecord::Migration[5.1]
  def change
    add_index(
      :joins_garages_break_categories, %w[garage_id break_category_id],
      unique: true, name: 'garage_index'
    )
  end
end
