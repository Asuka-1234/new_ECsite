class Address < ApplicationRecord
	belongs_to :end_user

	def order_address_union
		"〒" + self.postal_code + " " + self.address + " " + self.name
	end
end