class Public::EndUsersController < ApplicationController
  def show
  end

  def edit
  	@user = current_end_user
  end

  def update
  	@user = current_end_user
  	@user.update(end_user_params)
  	redirect_to public_end_users_path
  end

  def confirm
  end

  def withdraw
  	@user = current_end_user
  	@user.update(is_unsubscribed: true)
  	reset_session
  	redirect_to root_path
  end

  private
  def end_user_params
  	params.require(:end_user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :email, :address, :postal_code, :phone_number, :password, :password_confirmation)
  end

end

