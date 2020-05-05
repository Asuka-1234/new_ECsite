class Item < ApplicationRecord
	belongs_to :genre
	has_many :cart_items
	has_many :order_details
	attachment :image

	def self.search(name)
	  if name
		Item.where(['name LIKE ?', "%#{name}%"])
	  else
		Item.all
	  end
	end
end
