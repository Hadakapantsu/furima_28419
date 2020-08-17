class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end

class User < ApplicationRecord

  has_one :items, through:items_users
  has_one :comment

  with_options presence: true do

    ## ユーザー情報
    # ニックネームが必須であること
    validates :name, presence: true
    # メールアドレスが必須であること
    validates :email, presence: true
    # メールアドレスが一意性であること
    validates :email, uniqueness: true
    # メールアドレスは@を含む必要があること
    validates :email, inclusion: { in:%w(@) }
    # パスワードが必須であること
    validates :password, presence: true
    # パスワードは6文字以上であること
    validates :password, length: { minimum: 6 }
    # パスワードは半角英数字混合であること
    validates :password, format: { with: /\A[a-z0-9]+\z/i }
    # パスワードは確認用を含めて2回入力すること
    validates :password, :password_confirmation, numericality: { equal_to: true }

##本人情報確認
    # ユーザー本名が、名字と名前がそれぞれ必須であること
    validates :familyname, :firstname, presence: true
    # ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること
    format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    # ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること
    validates :rubi_familyname, :rubi_firstname, presence: true
    # ユーザー本名のフリガナは全角（カタカナ）で入力させること
    validates :rubi_familyname, :rubi_firstname, format: { with: /\A[ァ-ヶー－]+\z/ }
    # 生年月日が必須であること
    validates :birthday, presence: true


  end

end