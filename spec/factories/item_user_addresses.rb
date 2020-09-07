FactoryBot.define do
  factory :item_user_address do
    post_number { '123-4567' }
    prefecture_id { 1 }
    city              { '名古屋市中村区' }
    house_number      { '1-2-3' }
    buillding_name    { 'アイチ' }
    phone_number      { '12345678901' }
    token             { 'asdfghjklzxcvbnm' }

  end
end
