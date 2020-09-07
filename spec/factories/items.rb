FactoryBot.define do
  factory :item do
    # image                   { 'assets/images/star.png' }
    price            { '300' }
    name             { 'メガネ' }
    text             { 'テキスト' }
    category_id         { 1 }
    condition_id        { 1 }
    cost_burden_id	     { 1 }
    shipping_place_id   { 1 }
    shipping_day_id    { 1 }
    association :user
  end
end
