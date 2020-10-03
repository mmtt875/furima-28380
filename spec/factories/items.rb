FactoryBot.define do
  factory :item do
    name             {"うさぎ"}
    description      {"うさぎです"}
    category_id      {"2"}
    status_id        {"2"}
    delivery_fee_id  {"2"}
    area_id          {"2"}
    delivery_days_id {"2"}
    price            {"500"}
    association :user
  end
end
