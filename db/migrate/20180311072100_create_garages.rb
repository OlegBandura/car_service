class CreateGarages < ActiveRecord::Migration[5.1]
  def change
    create_table :garages do |t|
      t.references :user, index: true
      t.string :name
      t.text :description
      t.string :city
      t.string :address
      t.string :phone
      t.boolean :diler
      t.string :city
      t.text :image_url
      t.string :garage_rating
      t.string :city
      t.string :garage_types, array: true, default: []
      t.string :work_shedule, array: true, default: []

      t.timestamps
    end
  end
end
