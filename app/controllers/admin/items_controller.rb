class Admin::ItemsController < ApplicationController
  def index
  	#@itemss = Item.all
    @items = Item.search(params[:name]) 
    p @items
  end

  def new
  	@item = Item.new
  	@genres = Genre.all
  end

  def create
  	@item = Item.new(item_params)
  	@item.save 
  	redirect_to admin_item_path(@item)
  end

  def show
    @item = Item.find(params[:id]) 
  end

  def edit
  end

  private
  def item_params
  	params.require(:item).permit(:genre_id, :name, :description, :price, :image, :sales_status)
  end
end
