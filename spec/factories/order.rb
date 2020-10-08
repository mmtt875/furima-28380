FactoryBot.define do
  factory :order do
    postal_code   {"011-1111"}
    area_id       {"2"}
    city          {"ふわふわ市"}
    address       {"ふわふわ町２８"}
    building_name {"コーポふわふわ２０８"}
    phone_number  {"08028282828"}
    token         {"tokensample"}
  end
end
