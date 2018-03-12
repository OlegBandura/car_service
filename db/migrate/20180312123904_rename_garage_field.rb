class RenameGarageField < ActiveRecord::Migration[5.1]
  def change
    rename_column :garages, :name, :garage_name
  end
end
