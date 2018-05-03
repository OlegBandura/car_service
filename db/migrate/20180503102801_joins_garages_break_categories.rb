class JoinsGaragesBreakCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :joins_garages_break_categories, id: false do |t|
      t.integer :garage_id
      t.integer :break_category_id
    end
    add_index :joins_garages_break_categories, :garage_id, unique: true
    add_index :joins_garages_break_categories, :break_category_id, unique: true
  end
end
