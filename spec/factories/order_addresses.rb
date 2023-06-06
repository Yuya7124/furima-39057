FactoryBot.define do
  factory :order_address do
    Faker::Config.locale = :ja
    postal_code   { Faker::Address.postcode }
    prefecture    { Faker::Number.between(from: 1, to: 47) }
    city          { Faker::Address.name }
    house_number  { Faker::Address.street_address }
    building_name { Faker::Address.building_number }
    tel_number    { Faker::PhoneNumber.phone_number }
  end
end
