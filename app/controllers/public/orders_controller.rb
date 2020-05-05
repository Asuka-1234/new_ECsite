class Public::OrdersController < ApplicationController
  before_action :empty_order_item, only:[ :new ,:confirm, :create]

  def new
  	@order = Order.new
  end

  def index
  end

  def show
  end

  def complete
  end

  def confirm
  	@cart_items = current_end_user.cart_items
  	@total = 0
  	@cart_items.each do |cart_item|
  		@total += cart_item.amount*cart_item.item.price
  	end
  	@order = Order.new
  	@order.payment_method = params[:order][:payment_method].to_i
  	@select = params[:order][:address_select].to_i
  	if @select == 0
  		@order.address = current_end_user.address
  		@order.postal_code = current_end_user.postal_code
  		@order.name = current_end_user.first_name + current_end_user.last_name
  	elsif @select == 1
  		@a = params[:order][:address].to_i
  		@b = Address.find(@a)
  		@order.address = @b.address
  		@order.postal_code = @b.postal_code
  		@order.name = @b.name
  	else
  		@order.address = params[:order][:new_address]
  		@order.postal_code = params[:order][:new_postal_code]
  		@order.name = params[:order][:new_name]
  	end
  end

  def create
  	# @order = Order.new(order_params)
  	# @order.end_user_id = current_end_user.id
  	@order = current_end_user.orders.new(order_params)
  	@order.postage = 800
  	@order.save
  	current_end_user.cart_items.each do |cart_item|
  		@order_detail = @order.order_details.new
  		@order_detail.price = cart_item.item.price
  		@order_detail.item_id = cart_item.item.id
  		@order_detail.amount = cart_item.amount
  		@order_detail.save
  		cart_item.destroy
  	end
    @address = current_end_user.addresses.new
    @address.name = @order.name
    @address.address = @order.address
    @address.postal_code = @order.postal_code
    @address.save
  	redirect_to public_orders_complete_path
  end

  private
  def order_params
  	params.require(:order).permit(:end_user_id, :payment_method, :total, :postage, :order_status, :name, :address, :postal_code)
  end

  def empty_order_item
    if current_end_user.cart_items.empty?
      @cart_items = current_end_user.cart_items
      flash[:notice] = "カート内に商品がありません。"
      render '/public/cart_items/index.html'
    end
  end
end
