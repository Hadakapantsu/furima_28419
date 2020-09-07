class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_one :item_user

  with_options presence: true do
    validates :nickname
    validates :familyname, :firstname
    validates :rubi_familyname, :rubi_firstname
    validates :birthday

    # ユーザー本名が、名字と名前がそれぞれ必須であること,# ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること
    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/ } do
      validates :familyname
      validates :firstname
    end
    # ユーザー本名のフリガナが、名字と名前で,# ユーザー本名のフリガナは全角（カタカナ）で入力させること

    with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
      validates :rubi_familyname
      validates :rubi_firstname
    end
  end
end
