FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    # password              {Faker::Internet.password(min_length: 6)}
    password              {"aaa123"}
    password_confirmation {password}
    family_name           {"不破"}
    first_name            {"ふわり"}
    family_name_kana      {"フワ"}
    first_name_kana       {"フワリ"}
    birthday              {Faker::Date.backward}
  end
end