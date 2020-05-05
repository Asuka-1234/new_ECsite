class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :end_users_id
      t.integer :payment_method, default: 0
      t.integer :total
      t.integer :postage, default: 800
      t.integer :order_status, default: 0
      t.string :name
      t.string :addresss
      t.string :postal_code
      t.timestamps
    end
  end
end
