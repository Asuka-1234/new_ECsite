class Admin::EndUsersController < ApplicationController
  def index
  	@users = EndUser.all
  end

  def edit
  end

  private
  def end_user_params
  	params.require(:end_user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :email, :address, :postal_code, :phone_number, :password, :password_confirmation)
  end
end
