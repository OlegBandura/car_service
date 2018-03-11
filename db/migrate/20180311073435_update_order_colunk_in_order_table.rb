class UpdateOrderColunkInOrderTable < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :times, :string, array: true, default: []
  end
end
