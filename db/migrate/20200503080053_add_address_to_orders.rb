class AddAddressToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :address, :string

    remove_column :orders, :addresss
  end
end
