class Item < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :user
  # belongs_to :user, through: :item_user
  has_one :item_user
  #has_one :comment

  with_options presence: true do

    validates :image, presence: true
    validates :name, presence: true
    validates :text, presence: true
    validates :category, presence: true
    validates :condition, presence: true
    validates :cost_burden, presence: true
    validates :shipping_place, numericality: { other_than: 0, message: "can't be blank" }
    validates :shipping_days, presence: true
    validates :price, format: {with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}
    validates :user

  end

  validates :price, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 1000000, message: "is out of setting range"}
end




