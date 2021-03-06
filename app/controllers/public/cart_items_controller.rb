class Public::CartItemsController < ApplicationController
  def index
  	@cart_items = current_end_user.cart_items
  end

  def create
    #@cart_item = CartItem.new(cart_item_params)
    #@cart_item.end_user_id = current_end_user.id
    @cart_item = current_end_user.cart_items.new(cart_item_params)
    @quantity = current_end_user.cart_items.find_by(item_id: @cart_item.item_id)
    if @quantity
      @quantity.update(amount: @quantity.amount + @cart_item.amount)
    else
      @cart_item.save
    end 
    flash[:notice] = nil
  	redirect_to public_cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to public_cart_items_path
  end

  def destroy
  	cart_item = CartItem.find(params[:id])
  	cart_item.destroy
  	redirect_to public_cart_items_path
  end

  def destroy_all
  	cart_items = CartItem.all
  	cart_items.destroy_all
  	redirect_to public_cart_items_path
  end

  private
  def cart_item_params
  	params.require(:cart_item).permit(:item_id, :end_user_id, :amount)
  end
end
