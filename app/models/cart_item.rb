class CartItem < ApplicationRecord
	belongs_to :end_user
	belongs_to :item

	def item_added_by?(item)
		cart_items.where(item_id: item_id).exists?
	end
end
