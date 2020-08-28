class ApplicationController < ActionController::Base
  # before_action :authenticate_user! # ログインしているユーザーのみしかアクセスを許可しないようにする
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :familyname, :firstname, :rubi_familyname, :rubi_firstname, :birthday])
  end
end

# private
#     def sign_in_required
#       redirect_to new_user_session_url unless user_signed_in?
#     end