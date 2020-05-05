class Admin::OrdersController < ApplicationController
  def index
  	@orders = Order.all
  end

  def show
  	@order = Order.find(params[:id])
   	p @order.order_status
 	@order_details = @order.order_details
  end

  def update
  	p params[:order][:order_status] 
  	@order = Order.find(params[:id])
  	@order.order_status = params[:order][:order_status] 
  	#@order.order_details.production_status = params[:oder][:production_status]
  	@order.update(order_params)
  	if @order.order_status == "confirm"
 		@order.order_details.each do |detail|
 			detail.update(production_status:"waiting" )
 		end
 	end
  	redirect_to admin_order_path(@order)
  end

  def detail_update
  	@order_detail = OrderDetail.find(params[:id])
  	@order_detail.production_status = params[:order_detail][:production_status]
  	@order_detail.save
  	#@production_statuses = @order_detail.order.order_details.pluck(:production_status)
  	if @order_detail.production_status == "doing" 
  		@order_detail.order.update(order_status: "doing")
  	elsif @order_detail.order.order_details.pluck(:production_status).all?{|a| a == "done" }
  		@order_detail.order.update(order_status: "preparation")
    end  		
  	redirect_to admin_order_path(@order_detail.order)
  end

  private
  def order_params
  	params.require(:order).permit(:end_user_id, :payment_method, :total, :postage, :order_status, :name, :address, :postal_code)
  end

  def order_detail_params
  	params.require(:order_detail).permit(:order_id, :item_id, :amount, :price, :production_status)
  end
end
