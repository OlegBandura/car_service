class DeleteRowIdBrand < ActiveRecord::Migration[5.1]
  def change
    remove_column :car_models, :id_brand
  end
end
