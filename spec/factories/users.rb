FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {Faker::Name.initials}
    first_name            {Faker::Name.initials}
    family_name_kana      {"フワ"}
    first_name_kana       {"フワリ"}
    birthday              {Faker::Date.backward}
  end
end