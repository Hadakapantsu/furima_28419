class AddressesController < ApplicationController
  def index
    @addresses = Address.all
  end

  def new
    @adresses = ItemuserAddress.new
  end

  def create
    @adresses = ItemuserAddress.new(address_params)
    @address.save
    if @donation.valid?
      @donation.save  # バリデーションをクリアした時
      redirect_to root_path
    else
      render 'new'    # バリデーションに弾かれた時
    end
  end

  private

  def address_params
    params.require(:item_user_address).permit(:use_id, :item_id, :post_number, :prefecture_id, :city, :house_number, :buillding_name, :phone_number)
  end
end
