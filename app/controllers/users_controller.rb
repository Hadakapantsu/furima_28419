class UsersController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
  end

  def new
    @user = User.new
  end

  def create
    User.create（user_params）
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email)
  end

  def move_to_index
    unless user_signed_in?   #unlessでuser_signed_in?を判定して、その返り値がfalseだった場合にredirect_toが実行される。
      redirect_to action: :index
    end
  end

end
