FactoryBot.define do
  factory :item do
    # image                   { 'assets/images/star.png' }
    price                   { '300' }
    name                    { 'メガネ' }
    text                    { 'テキスト' }
    category                { '1' }
    condition               { '1' }
    cost_burden	            { '1' }
    shipping_place	        { '1' }
    shipping_days           { '1' }
    association :user


   end
end
