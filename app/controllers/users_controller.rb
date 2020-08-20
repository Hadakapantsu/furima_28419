class UsersController < ApplicationController
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
    # if current_user.update(user_params)
    # redirect_to root_path
    # else
    # render :edit
    # end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email)
  end
end
