class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
 
  # has_one :comment

  with_options presence: true do
    validates :name, presence: true
    validates :text, presence: true
    validates :category, presence: true
    validates :condition, presence: true
    validates :cost_burden, presence: true
    validates :shipping_place, presence: true
    validates :shipping_days, presence: true
    validates :price, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters.' }
    validates :user_id

    validates :image



    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
  end
end
