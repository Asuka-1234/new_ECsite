class Public::ItemsController < ApplicationController
  def top
  end

  def index
  	@items = Item.all
  end

  def show
  	@item = Item.find(params[:id])
  	@cart_item = CartItem.new
  end

  private
  def item_params
  	params.require(:item).permit(:genre_id, :name, :description, :price, :image, :sales_status)
  end
end
