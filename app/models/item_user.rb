class ItemUser < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :user
  belongs_to :item
  # has_one :address
end
