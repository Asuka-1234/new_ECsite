class AddEndUserIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :end_user_id, :integer
    remove_column :orders, :end_users_id
  end
end
