require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    # let(:user) { FactoryBot.create(:user) }

    before do
      @user = FactoryBot.create(:user)   # userのアソシエーション情報を取得してる
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('star.png')
      @item.user_id = @user.id           # itemのuser_idを取り出してる
    end

    context '登録が上手くいくとき' do
      it 'imageとname、text、category,condition,cost_burden,shipping_place,shipping_day ,priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '登録が上手くいかないとき' do
      it '画像は1枚必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が必須であること' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '発送元の地域についての情報が必須であること' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end

      it 'カテゴリーの情報が必須であること' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態についての情報が必須であること' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it '配送料の負担についての情報が必須であること' do
        @item.cost_burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost burden can't be blank")
      end

      it '発送元の地域についての情報が必須であること' do
        @item.shipping_place_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping place can't be blank")
      end

      it '発送までの日数についての情報が必須であること' do
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end

      it '価格についての情報が必須であること' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格の範囲が、¥300~¥9,999,999を下回る時' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end

      it '価格の範囲が、¥300~¥9,999,999を上回る時' do
        @item.price = '100000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
    end
  end
end

# - ログインしているユーザーだけが、出品ページへ遷移できること
# - 入力された販売価格によって、非同期的に販売手数料や販売利益が変わること(JavaScriptを使用して実装すること)
