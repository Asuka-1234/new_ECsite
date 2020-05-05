class public::AddressesController < ApplicationController
  def index
  end

  def create
  end

  def edit
  end

  private
  def address_params
  	params.require(:address).permit(:name, :address, :postal_code)
  end
end
