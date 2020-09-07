require 'rails_helper'

RSpec.describe ItemUserAddress, type: :model do
  describe '#create' do
    
    before do
      @user = FactoryBot.create(:user)    # userのアソシエーション情報を取得してる
      @item = FactoryBot.build(:item)     # itemのアソシエーション情報を取得してる 
      @item.image = fixture_file_upload('star.png')
      @item_user_address = FactoryBot.build(:item_user_address)
    end
 
    context '登録が上手くいくとき' do
      # :remember_token, :user, :item, :post_number, :prefecture, :city, :house_number, :phone_number
      it 'token,post_number,prefecture,city,house_number,phone_numberが存在すれば登録できる' do
        expect(@item_user_address).to be_valid
      end

      it '郵便番号にハイフンが必要であること' do
        @item_user_address.post_number = '123-4567'
        expect(@item_user_address).to be_valid
      end

      it '電話番号にはハイフンは不要で、11桁以内であること' do
        @item_user_address.phone_number = '12345678901'
        expect(@item_user_address).to be_valid
      end

      it '電話番号にはハイフンは不要で、11桁以内であること' do
        @item_user_address.phone_number = '12345678901'
        expect(@item_user_address).to be_valid
      end
    end

    context '登録が上手くいかないとき' do
      it 'クレジットカード情報がないと決済できない' do
        @item_user_address.token = nil
        @item_user_address.valid?
        expect(@item_user_address.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号がないと登録できない' do
        @item_user_address.post_number = nil
        @item_user_address.valid?
        expect(@item_user_address.errors.full_messages).to include("Post number can't be blank", "Post number is invalid. Include hyphen(-)")
      end

      it '郵便番号にハイフンががないと登録できない' do
        @item_user_address.post_number = '1234567'
        @item_user_address.valid?
        expect(@item_user_address.errors.full_messages).to include("Post number is invalid. Include hyphen(-)")
      end

      it '都道府県がないと登録できない' do
        @item_user_address.prefecture_id = nil
        @item_user_address.valid?
        expect(@item_user_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村がないと登録できない' do
        @item_user_address.city = nil
        @item_user_address.valid?
        expect(@item_user_address.errors.full_messages).to include("City can't be blank")
      end

      it '番地がないと登録できない' do
        @item_user_address.house_number = nil
        @item_user_address.valid?
        expect(@item_user_address.errors.full_messages).to include("House number can't be blank")
      end

      it '電話番号がないと登録できない' do
        @item_user_address.phone_number = nil
        @item_user_address.valid?
        expect(@item_user_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号にハイフンがあると登録できない' do
        @item_user_address.phone_number = '123-4567-8901'
        @item_user_address.valid?
        expect(@item_user_address.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号が11桁以上であるとき登録できない' do 
        @item_user_address.post_number = '123456789012'
        @item_user_address.valid?
        expect(@item_user_address.errors.full_messages).to include("Post number is invalid. Include hyphen(-)")
      end






      # it '郵便番号がないと登録できない' do
      #   @address. = nil
      #   @address.valid?
      #   expect(@address.errors.full_messages).to include("Image can't be blank")
      # end

      # it '郵便番号がないと登録できない' do
      #   @address. = nil
      #   @address.valid?
      #   expect(@address.errors.full_messages).to include("Image can't be blank")
      # end

      # it '郵便番号がないと登録できない' do
      #   @address.post_number = nil
      #   @address.valid?
      #   expect(@address.errors.full_messages).to include("Image can't be blank")
      # end

    end
  end

end
