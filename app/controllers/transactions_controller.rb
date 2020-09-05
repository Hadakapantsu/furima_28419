class TransactionsController < ApplicationController

  def index
    @transaction = ItemUserAddress.new(params[:id])
    @item = Item.find(params[:item_id]) #ネストさせているときは[:id]ではなく[:item_id]と表記する。
  end

  def create
    # post @item =  Item.find(params[:id])
    @transaction =ItemUserAddress.new(transaction_params)
    @item = Item.find(params[:item_id])
  
    if @transaction.valid?  #@transactionの値が正常にデータベースに保存できるかどうかを確認しています
      pay_item #trueが返されたら「pay_item」が起動
      @transaction.save
      return redirect_to root_path #保存後は元の購入画面にリダイレクトするようにします
    else
      render 'index' #falseが返されたら再度情報入力画面を表示し、入力を促すようにします
    end
  end

  private

  def transaction_params
    params.permit(:item_id, :post_number, :prefecture_id, :city, :house_number, :buillding_name, :phone_number).merge(user_id: current_user.id) #item_user_id: item_user.id
  end

  def item_id_params
    params.require(:item).permit(:name, :image, :price, :text).merge(user_id: current_user.id)
    # params.permit(:name, :image, :price, :text).merge(user_id: current_user.id)
 
  end

  def pay_item
      # binding.pry
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵 
    Payjp::Charge.create(
      amount: @item.price,   # 商品の値段   上記で@itemを定義敷いているので、この記述のように値段を取り出せる。
      card: params[:token],  # カードトークン  パラムスの中でtoken情報を引き出せているので、このような記述で問題ない。
      currency:'jpy'         # 通貨の種類(日本円)
    )
  
  end

end
