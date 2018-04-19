class AddEmailToGarages < ActiveRecord::Migration[5.1]
  def change
    add_column :garages, :garage_email, :string
  end
end
