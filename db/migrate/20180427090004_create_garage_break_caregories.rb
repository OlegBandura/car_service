# migration create_garage_break_categories
class CreateGarageBreakCaregories < ActiveRecord::Migration[5.1]
  def change
    create_table :garage_break_caregories do |t|
      t.references :break_categories, index: true
      t.references :garages, index: true
      t.timestamps
    end
  end
end
