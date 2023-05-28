FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    transient do
      person { Gimei.name }
    end
    surname               {person.first}
    given_name            {person.last}
    read_surname          {person.first.katakana}
    read_given_name       {person.last.katakana}
    birth_data              {Faker::Date.backward}
  end
end
