class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :user_car, index: true
      t.references :garage, index: true
      t.references :break_sub_category, index: true
      t.string :description
      t.string array: true, default: []
      t.string :status

      t.timestamps
    end
  end
end
