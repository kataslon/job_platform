FactoryGirl.define do
  factory :proposal do
    user_id 1
    speciality_id 1
    summary "My Summary"
    salary 1000
    description { Faker::Lorem.paragraph(5) }
  end
end
