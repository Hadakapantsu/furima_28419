class ItemUserAddress # CardAddress
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :post_number, :prefecture_id, :city, :house_number, :buillding_name, :phone_number

  with_options presence: true do
    validates :post_number, format: { with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id 
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
  end

  def save
    item_user = ItemUser.create(user_id: user_id, item_id: item_id)
    Address.create(post_number: post_number, prefecture_id: prefecture_id, city: city, house_number: house_number, buillding_name: buillding_name, phone_number: phone_number, item_user_id: item_user.id)
  end
end
