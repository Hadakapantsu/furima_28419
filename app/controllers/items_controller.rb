class ItemsController < ApplicationController
  before_action :move_to_index, except: [:new, :create, :update]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
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

    item = Item.find(params[:id])
    render json: { post: item }
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
  end

  def edit
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :price, :text, :category, :condition, :cost_burden, :shipping_place, :shipping_days).merge(user_id: current_user.id)
  end

  # def set_tweet
  #  @tweet = Tweet.find(params[:id])
  # end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
