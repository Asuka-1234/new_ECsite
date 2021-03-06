# frozen_string_literal: true

class EndUsers::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  def after_sign_in_path_for(resource)
    public_end_users_path
  end

  #def new
  #  if end_user_signed_in?
  #    redirect_to public_end_users_path
  #  else
  #    redirect_to new_end_user_session_path
  #  end
  #end

  def after_sign_out_path_for(resource)
    new_end_user_session_path
  end
  
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  private
  def reject_user
    @user = EndUser.find_by(email: params[:end_user][:email].downcase)
    if @user
      (@user.valid_password?(params[:end_user][:password]) && (@user.active_for_authentication? == false))
      redirect_to new_end_user_session_path
    end
  end

end
