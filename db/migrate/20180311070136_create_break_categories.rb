class CreateBreakCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :break_categories do |t|
      t.references :garage, index: true
      t.string :name

      t.timestamps
    end
  end
end
