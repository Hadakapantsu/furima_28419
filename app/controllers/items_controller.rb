class ItemsController < ApplicationController
  before_action :move_to_index, only: [:new, :create, :update, :edit] # ログインしてるユーザーのみnew,create,update,editが使用できる。
  # こう書いても同じ意味になる→  before_action :move_to_index, expect: [:index, :show, :destroy](3つを除外する)
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :move_to_index_if_not_seller, only: [:edit, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path # (id: item_path)
    else
      render :new
    end
  end

  def checked
    post = Item.find(params[:id])
    if post.checked
      post.update(checked: false)
    else
      post.update(checked: true)
    end

    @item = Item.find(params[:id])
    render json: { post: item }
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path # (id: item_path)
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @item.destroy
    redirect_to root_path 
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :image, :price, :text, :category_id, :condition_id, :cost_burden_id, :shipping_place_id, :shipping_day_id).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def move_to_index_if_not_seller
    redirect_to root_path unless user_signed_in? && current_user.id == @item.user_id
  end
end
