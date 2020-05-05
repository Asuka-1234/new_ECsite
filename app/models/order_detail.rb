class OrderDetail < ApplicationRecord
	belongs_to :item
	belongs_to :order

	enum production_status:[:unable, :waiting, :doing, :done]
end
