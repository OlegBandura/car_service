class RenameBrandColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :brands, :brand, :brand_name
  end
end
