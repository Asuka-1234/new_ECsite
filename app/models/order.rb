class Order < ApplicationRecord
	belongs_to :end_user
	has_many :order_details

	enum payment_method:[ :credit_card, :bank_transfer]
	enum order_status:[ :waiting, :confirm, :doing, :preparation, :done]
end
