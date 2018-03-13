class RenameImgUrl < ActiveRecord::Migration[5.1]
  def change
    rename_column :garages, :image_url, :image
  end
end
