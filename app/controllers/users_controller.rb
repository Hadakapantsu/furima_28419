class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :new]
  before_action :move_to_index, except: [:index, :show]

  def index
    # @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new（user_params）
  end

  def edit
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
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
    params.require(:user).permit(:email, :password)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in? 
    # unlessでuser_signed_in?を判定して、その返り値がfalseだった場合にredirect_toが実行される。
  end
end
