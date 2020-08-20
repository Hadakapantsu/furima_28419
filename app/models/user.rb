class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #has_many :items, through:items_users
  #has_one :comment
         



  with_options presence: true do

  ## ユーザー情報
    # ニックネームが必須であること
     validates :password, length: { minimum: 6 }
     validates :nickname, presence: true
     validates :familyname, :firstname, presence: true
     validates :rubi_familyname, :rubi_firstname, presence: true
     validates :birthday, presence: true
 
  ##本人情報確認
    # ユーザー本名が、名字と名前がそれぞれ必須であること,# ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること
   with_options format:  {with: /\A[ぁ-んァ-ン一-龥]/} do
     validates :familyname
     validates :firstname
   end
    # ユーザー本名のフリガナが、名字と名前で,# ユーザー本名のフリガナは全角（カタカナ）で入力させること

    with_options format: {with: /\A[ァ-ヶー－]+\z/} do
     validates :rubi_familyname
     validates :rubi_firstname
    end

     
  end

end