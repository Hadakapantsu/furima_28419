require 'rails_helper'

RSpec.describe Address, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.create(:user)   # userのアソシエーション情報を取得してる
      @item = FactoryBot.create(:item)   # itemのアソシエーション情報を取得してる
      @address = FactoryBot.build(:address)
    end

    context '登録が上手くいくとき' do
      :remember_token, :user, :item, :post_number, :prefecture, :city, :house_number, :phone_number

      it 'token,post_number,prefecture,city,house_number,phone_numberが存在すれば登録できる' do
        expect(@address).to be_valid
      end

      it '郵便番号にハイフンが必要であること' do
        @address.post_number = 123-4567
        expect(@address).to be_valid
      end

      it '電話番号にはハイフンは不要で、11桁以内であること' do
        @address.post_number = 09012345678
        expect(@address).to be_valid
      end
    end


    クレジットカード決済ができること
    クレジットカードの情報は購入の都度入力させること
    クレジットカード情報は必須であり、正しいクレジットカードの情報で無いときは決済できないこと
    配送先の住所情報も購入の都度入力させること

    context '登録が上手くいかないとき' do
      it '郵便番号がないと登録できない' do
        @address.post_number = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Post_number can't be blank")
      end

      it '郵便番号にハイフンががないと登録できない' do
        @address.post_number = 1234567
        @address.valid?
        expect(@address.errors.full_messages).to include("- can't be blank")
      end

      it '都道府県がないと登録できない' do
        @address.prefecture = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村がないと登録できない' do
        @address.city = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("City can't be blank")
      end

      it '番地がないと登録できない' do
        @address.house_number = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("House_number can't be blank")
      end

      it '電話番号がないと登録できない' do
        @address.phone_number = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone_number can't be blank")
      end

      it '電話番号にハイフンがあると登録できない' do
        @address.phone_number = 090-1234-5678
        @address.valid?
        expect(@address.errors.full_messages).to include("Image can't be blank")
      end






      it '郵便番号がないと登録できない' do
        @address. = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Image can't be blank")
      end

      it '郵便番号がないと登録できない' do
        @address. = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Image can't be blank")
      end

      it '郵便番号がないと登録できない' do
        @address.post_number = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Image can't be blank")
      end

    end
      
end
