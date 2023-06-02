FactoryBot.define do
  factory :item do
    association :user

    product_name     {Faker::Lorem.sentence}
    explanation      {Faker::Lorem.sentence}
    category_id      {Faker::Number.between(from: 1, to: 11)}
    condition_id     {Faker::Number.between(from: 1, to: 7)}
    delivery_type_id {Faker::Number.between(from: 1, to: 3)}
    prefecture_id    {Faker::Number.between(from: 1, to: 47)}
    shipment_date_id {Faker::Number.between(from: 1, to: 4)}
    cost             {Faker::Number.between(from: 300, to: 9999999)}

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
