class Item < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #belongs_to :user, through:items_users
  #has_one :items_users
  #has_one :comment
         

end
