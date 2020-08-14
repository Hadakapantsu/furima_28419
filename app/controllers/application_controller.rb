class ApplicationController < ActionController::Base
  before_action :basic_auth
  
  private
  
    def basic_auth
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]  # 環境変数を読み込む記述に変更
    end
  end



  before_action :authenticate_user!  #ログインしているユーザーのみしかアクセスを許可しないようにする  
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nichname, :email, :password, :familyname, :fiestname, :rubi_familyname, :rubi_fiestname, :birthday])
  end

  
end