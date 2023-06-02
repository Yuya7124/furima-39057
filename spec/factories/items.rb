FactoryBot.define do
  factory :item do
    association :user

    product_name     {Faker::Lorem.sentence}
    explanation      {Faker::Lorem.sentence}
    category_id      {Faker::Number.between(to: 11)}
    condition_id     {Faker::Number.between(to: 7)}
    delivery_tyoe_id {Faker::Number.between(to: 3)}
    prefecture_id    {Faker::Number.between(to: 47)}
    shipment_date_id {Faker::Number.between(to: 4)}
    cost             {Faker::Number.between(from: 300, to: 9999999)}

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
