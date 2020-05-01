class Satatus < ActiveRecord::Migration[5.2]
  def change
  	remove_column :items,:sales_status, :boolean
  end
end
