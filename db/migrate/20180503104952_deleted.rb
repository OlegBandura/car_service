class Deleted < ActiveRecord::Migration[5.1]
  def change
    drop_table :joins_garages_break_categories
  end
end
