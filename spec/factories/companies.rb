FactoryGirl.define do
  factory :company do
    name { Faker::Company.name }
    description { Faker::Lorem.paragraph(5) }
    city_id 1
  end
end
