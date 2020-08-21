class ApplicationController < ActionController::Base

  # before_action :authenticate_user! # ログインしているユーザーのみしかアクセスを許可しないようにする
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :familyname, :firstname, :rubi_familyname, :rubi_firstname, :birthday])
    end

end
