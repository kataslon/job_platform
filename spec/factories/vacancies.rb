FactoryGirl.define do
  factory :vacancy do
    title { Faker::Company.catch_phrase }
    description { Faker::Lorem.paragraph(8) }
    company_id 1
    deadline { Faker::Date.between(2.days.ago, 20.days.from_now) }
    speciality_id 1
    relevance true
  end
end
