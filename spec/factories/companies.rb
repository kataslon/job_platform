FactoryGirl.define do
  factory :company do
    name { Faker::Company.name }
    description { Faker::Company.catch_phrase }
    city_id 1
  end
end
