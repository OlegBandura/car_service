class CreateCarModels < ActiveRecord::Migration[5.1]
  def change
    create_table :car_models do |t|
      t.references :brand, index: true
      t.string :model

      t.timestamps
    end
  end
end
