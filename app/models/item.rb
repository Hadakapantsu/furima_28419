class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category  #モデル名
  belongs_to_active_hash :condition
  belongs_to_active_hash :cost_burden
  belongs_to_active_hash :shipping_place
  belongs_to_active_hash :shipping_day
 
  belongs_to :user
  has_one_attached :image
  
  with_options presence: true do #カラム名
    validates :name, presence: true
    validates :text, presence: true
    validates :category_id, presence: true
    validates :condition_id, presence: true
    validates :cost_burden_id, presence: true
    validates :shipping_place_id, presence: true
    validates :shipping_day_id, presence: true
    validates :price, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters.' }
    validates :user_id

    validates :image

    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
  end
end
