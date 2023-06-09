FactoryBot.define do
  factory :order_address do
    #クレジット情報
    token         {"tok_abcdefghijk00000000000000000"}

    #お届け先情報
    Faker::Config.locale = :ja
    postal_code   { Faker::Address.postcode }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    city          { Faker::Address.name }
    house_number  { Faker::Address.street_address }
    building_name { Faker::Address.building_number }
    tel_number    { '0901234567' }
  end
end
