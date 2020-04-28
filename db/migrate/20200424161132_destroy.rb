class Destroy < ActiveRecord::Migration[5.2]
  def change
  	remove_column :end_users, :first_name, :string
    remove_column :end_users, :last_name, :string
    remove_column :end_users, :first_name_kana, :string
    remove_column :end_users, :last_name_kana, :string
    remove_column :end_users, :address, :string
    remove_column :end_users, :postal_code, :string
    remove_column :end_users, :phone_number, :string
    remove_column :end_users, :is_unsubscribed, :boolean, default: false
  end
end
