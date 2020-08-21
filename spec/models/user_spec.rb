require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '登録が上手くいくとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、ユーザー名の本名、フリガナ、誕生日が存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上であれば登録できる' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        expect(@user).to be_valid
      end

      it 'パスワードは半角英数字混合であること' do
        @user.password = '123abc'
        expect(@user).to be_valid
      end

      it 'パスワードは半角英数字混合であること' do
        @user.password = '123abc'
        expect(@user).to be_valid
      end
    end

    context '登録が上手くいかないとき' do
      it 'ニックネームが必須であること' do 
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'メールアドレスが必須であること' do 
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'メールアドレスが一意性であること' do 
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'メールアドレスは@を含む必要があること' do 
        @user.email = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'パスワードが必須であること' do 
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      
      it 'パスワードは6文字以上であること' do 
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'パスワードは半角英数字混合であること' do 
        @user.password = 'パスワード'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'パスワードは確認用を含めて2回入力すること' do 
        @user.password = '123abc'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'ユーザー本名が、名字が必須であること' do
        @user.familyname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Familyname can't be blank")
      end

      it 'ユーザー本名が、名前が必須であること' do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end

      it 'ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること' do
        @user.familyname = 'aaa'
        @user.firstname = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Familyname is invalid', 'Firstname is invalid')
      end

      it 'ユーザー名字のフリガナが必須であること' do
        @user.rubi_familyname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Rubi familyname can't be blank")
      end

      it 'ユーザー名前のフリガナが必須であること' do
        @user.rubi_firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Rubi firstname can't be blank")
      end

      it 'ユーザー苗字のフリガナは全角（カタカナ）で入力させること' do
        @user.rubi_familyname = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Rubi familyname is invalid')
      end

      it 'ユーザー名前のフリガナは全角（カタカナ）で入力させること' do
        @user.rubi_firstname = 'bbb'
        @user.valid?
        expect(@user.errors.full_messages).to include('Rubi firstname is invalid')
      end

      it '生年月日がないこと' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
