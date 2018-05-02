class CreateGarageBreakCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :garage_break_categories do |t|
      t.references :break_categories_ids, :integer, array: true, default: []
      t.references :garages, index: true
      t.timestamps
    end
  end
end
