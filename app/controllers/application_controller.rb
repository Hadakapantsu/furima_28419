class ApplicationController < ActionController::Base
  before_action :basic_auth
  
    private
  
    def basic_auth
      authenticate_or_request_with_http_basic do |username, password|
        username == 'Hadakapantsu' && password == 'KazuSaku1227'  # 環境変数を読み込む記述に変更
      end
    end
  end