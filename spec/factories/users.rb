FactoryBot.define do
  factory :user do
    nickname                         { 'yama' }
    email                            { Faker::Internet.email }
    password                         { '123abc' }
    password_confirmation            { '123abc' }
    familyname                       { '山田' }
    firstname                        { '太郎' }
    rubi_familyname                  { 'ヤマダ' }
    rubi_firstname                   { 'タロウ' }
    birthday                         { Faker::Date.birthday }
    # text {Faker::Lorem.sentence}
    # association :
  end
end

#  birth_year            {2020}
#  birth_month           {1}
#  birth_day             {1}
